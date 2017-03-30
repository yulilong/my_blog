从继承关系来说，是Class --> Module --> Object，即Object是继承树的顶层，紧接着是Module，然后是Class。  

irb的输出结果：     
```
2.3.0 :008 > puts Object.superclass
BasicObject
 => nil 
2.3.0 :009 > puts Module.superclass 
Object
 => nil 
2.3.0 :010 > puts Class.superclass  
Module
 => nil 
2.3.0 :011 > puts Object.public_methods - Kernel.public_methods  
new
allocate
superclass
 => nil 
```     
从上面的输出可以看出，Object中自己定义的方法只有"superclass" , "allocate"和"new"这三个方法，其余的方法，比如"class", "to_s", "object_id"等等都是在Kernel中实现的。     

ruby中：    

* 在Ruby中使用Class来标识所有的数据类型，所有的变量和常量都是Object的子类      
* Kernel是Module，Object的实现中包含了Kernel      

![WX20170330-164838.png](https://bitbucket.org/repo/oE6yEX/images/825673219-WX20170330-164838.png)       
https://www.zhihu.com/question/19922190/answer/13359458