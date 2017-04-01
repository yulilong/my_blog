* **N+1问题:**
N+1问题是数据库访问中最常见的一个性能问题，首先介绍一下什么是N+1问题：        
举个例子，我们数据库中有两张表，一个是Customers，一个是Orders。Orders中含有一个外键customer_id，指向了Customers的主键id。  
想要得到所有Customer以及其分别对应的Order，一种写法是：    
`SELECT * FROM Customers;`     
对于每一个Customer；    
`SELECT * FROM Orders WHERE Orders.customer_id = #{customer.id}`    
这样我们实际对数据库做了N+1次查询：选择所有Customer一次得到N个Customer，对于N个Customer分别选择其对应的Order一共N次。所以，一共执行了N+1次查询，这就是N+1问题      

* **N+1问题的一般解决方法:**    
使用Left Join一次性取出所有数据：     
`SELECT * FROM Customers LEFT JOIN Orders on Customers.id = Orders.customer_id`      
这样虽然取出的数据相对多一些，但是只需要一次执行     
-----
* **Rails中的N+1问题:**      
因为Rails使用ActiveRecord访问数据库。所以，它的N+1问题暴露的不是那么明显。     
假设有如下代码，查找 10 条客户记录并打印这些客户的邮编：     
```
#!ruby
clients = Client.limit(10)
clients.each do |client|
  puts client.address.postcode
end
```  
上面的代码第一眼看起来不错，但实际上存在查询总次数较高的问题。这段代码总共需要执行 1（查找 10 条客户记录）+ 10（每条客户记录都需要加载地址）= 11 次查询。       

* **Rails中 N + 1 查询问题的解决办法:**    
Active Record 允许我们提前指明需要加载的所有关联，这是通过在调用 Model.find 时指明 includes 方法实现的。通过指明 includes 方法，Active Record 会使用尽可能少的查询来加载所有已指明的关联。     
回到之前 N + 1 查询问题的例子，我们重写其中的 Client.limit(10) 来使用及早加载：     
```
#!ruby
clients = Client.includes(:address).limit(10)
clients.each do |client|
  puts client.address.postcode
end
```     
上面的代码只执行 2 次查询，而不是之前的 11 次查询：     
```
#!mysql
SELECT * FROM clients LIMIT 10
SELECT addresses.* FROM addresses
  WHERE (addresses.client_id IN (1,2,3,4,5,6,7,8,9,10))
```     

参考资料：   
http://www.cnblogs.com/15ho/p/6625673.html      
http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations     
http://guides.ruby-china.org/active_record_querying.html#%E5%8F%8A%E6%97%A9%E5%8A%A0%E8%BD%BD%E5%85%B3%E8%81%94