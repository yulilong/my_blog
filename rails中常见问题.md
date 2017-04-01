* **Rails 浅谈 ActiveRecord 的 N + 1 查询问题**     

N+1问题是数据库访问中最常见的一个性能问题，首先介绍一下什么是N+1问题：        
举个例子，我们数据库中有两张表，一个是Customers，一个是Orders。Orders中含有一个外键customer_id，指向了Customers的主键id。  
想要得到所有Customer以及其分别对应的Order，一种写法是：    
```
SELECT * FROM Customers;
```
对于每一个Customer；    
```
SELECT * FROM Orders WHERE Orders.customer_id = #{customer.id}
```
这样我们实际对数据库做了N+1次查询：选择所有Customer一次得到N个Customer，对于N个Customer分别选择其对应的Order一共N次。所以，一共执行了N+1次查询，这就是N+1问题      

**N+1问题的一般解决方法:**    
使用Left Join一次性取出所有数据：     
```
SELECT * FROM Customers LEFT JOIN Orders on Customers.id = Orders.customer_id
```
这样虽然取出的数据相对多一些，但是只需要一次执行