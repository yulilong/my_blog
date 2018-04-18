###  [**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)     
-----------------------------------------------------------------------------------------

## 参考链接    

* [**理解Ruby中的作用域**](http://www.cnblogs.com/xrlin/p/5914712.html)      
* [**Ruby 中的类与对象**](https://ruby-china.org/topics/32637)     
* [**Ruby学习之元编程**](http://jingpin.jikexueyuan.com/article/58180.html)　　Kernel#evel(), Object#instance_evel()、Module#class_evel()      

## 知识点  

* [**ruby中include和extend以及模块中ClassMethods**](https://bitbucket.org/yulilong/my_wiki/wiki/ruby%E4%B8%ADinclude%E5%92%8Cextend%E4%BB%A5%E5%8F%8A%E6%A8%A1%E5%9D%97%E4%B8%ADClassMethods%20)      

* [**Ruby require,load,include,extend的显著区别**](https://bitbucket.org/yulilong/my_wiki/wiki/Ruby%20require,load,include,extend%E7%9A%84%E6%98%BE%E8%91%97%E5%8C%BA%E5%88%AB)       

* [**Ruby中的 Object、Class、Module之间关系**](https://bitbucket.org/yulilong/my_wiki/wiki/Ruby%E4%B8%AD%E7%9A%84Object%E3%80%81Class%E3%80%81Module%E4%B9%8B%E9%97%B4%E5%85%B3%E7%B3%BB)　　Class与Module的区别        

-------

* **method查看方法是哪个类定义的 methods查看对象有哪些方法**
* **source_locationc查看方法定义处**

```
method = method('_run_validate_callbacks')
p method
p method.source_location
#<Method: ManageIQ::Providers::Aliyun::CloudManager::Vm(ActiveRecord::Base)#_run_validate_callbacks>
# ["/home/yulilong/.rvm/gems/ruby-2.3.0/gems/activesupport-5.0.0.1/lib/active_support/callbacks.rb", 749
```

* **检查一个变量是否已经定义**    
可以用defined?，如果未定义会返回字符串"nil"，否则返回该变量的定义类型。如下面的例子:    
```
irb(main):007:0> a = 1
=> 1
irb(main):008:0> defined? a
=> "local-variable"
irb(main):009:0> defined? b
=> nil
irb(main):010:0> defined? nil
=> "nil"
irb(main):011:0> defined? String
=> "constant"
irb(main):012:0> defined? 1
=> "expression"
```

* **p caller 可以查看是谁调用了你**


* **ruby的class << self, 及其class_eval和instance_eval的区别**
http://blog.csdn.net/lyx2007825/article/details/10089115
```
class Array  
  class << self  
    def hint  
      "hello"  
    end  
  end  
end  
Array.hint
这段代码是添加类方法，只能类去调用这个方法
```
* **对象中存在实例变量 (instance variables) ，可以通过方法 instance_variables 进行查看当前对象中的 实例变量**    
```
class MyClass
  def my_method
    @v = 1
  end
end
obj = MyClass.new
obj.class   # => MyClass
obj.instance_variables  # => []
obj.my_method
obj.instance_variables  # => [:@v]
```

* **.class的使用**   
因为类也是一种对象，因此所有对象的特性也是类具有的特性。比如，(Class) 有自己的类，这个类就是——Class，举个例子，假如一个字符串可以通过 str#class 获得它的类 String ，那么 String 作为一个对象也可以通过 String#class 获知它自己的类。比如下面的代码:  
```
"hello".class   # => String
String.class    # => Class
Class.class     # => Class
```

### 类方法的定义

```ruby
class HelloWorld
  def greet
  end
end

# 1.在class <<类名 ~end 这个特殊的类定义中，以定义实例方法的形式来定义类方法
class << HelloMethod
    def SayHello(name)
        puts "#{name} say hello"
    end
end
HelloMethod.SayHello("Bob")

#2.在class上下文中使用self时，引用的对象是该类本身，因此可以使用class << self ~ end来定义
class ClassMethod
  class << self
    def Hello(name)
      puts "#{name} say hello!"
    end
  end
end
ClassMethod.Hello("Bob")

#3.使用def 类名.方法名 ~end 这样的形式来定义类方法
class ClassMethod
    def ClassMethod.SayHello(name)
        puts "#{name} say hello"
    end
end
ClassMethod.SayHello("Ruby")

#4.同样类似第二种方法一样使用self
class ClassMethod
  def self.SayHello(name)
    puts "#{name} say hello"
  end
end
ClassMethod.SayHello("Bob")

# 参考链接：https://www.jianshu.com/p/ae6e78602586
```
* **ruby 中super和super()的区别**      
http://blog.csdn.net/autumn20080101/article/details/8146310
```
我们经常要在子类的initialize方法中调用super和super()。
从语法上说super和super()是有微妙区别的。
super不带括号表示调用父类的同名函数，并将本函数的所有参数传入父类的同名函数；
super()带括号则表示调用父类的同名函数，但是不传入任何参数；
class SParent  
    def initialize *args  
        args.each {|arg| puts arg}  
    end  
end  
   
class SChild < SParent  
    def initialize a, b, c  
        super  
    end  
end  
   
a, b, c = *%W[a b c]  
SChild.new a, b, c # puts a, b, c if super  
SChild.new a, b, c # puts nothing if super() 
可以看出当SChild的initialize中调用super()时，代码是不会打印任何信息的。这是因为super()没有向SParent的initialize方法传任何参数。
```

* **ruby 类方法中 self.class.方法名**      
子类中方法调用父类中同名的 类方法
```
class AA
  def self.te
    p 'I an AA'
  end
end
class BB < AA
  def te
    self.class.te
  end
end
a = BB.new
a.te
# "I an AA"
```

* **完美理解ruby中的yield的概念**     
```
 看到axgle 兄解释ruby中的yield的概念，形象的理解为“占位”的作用。  
   但是对yield还可以带着参数的概念总觉得有点不够形象，  
   def foo  
     yield [1,2,3]  
   end  
   foo {|v| p v}  
   以我看来更像是，比喻成一个纯虚函数更好理解，其中，在方法后跟块后，不过就是对yield的声明化了而已。  

 不过对于初步理解yield还是有很好帮助，算是完美解释了。  
大学里常常发生占位置的现象：头天晚上拿一本书放在课座上，表示位置已经被占了;第二天才来到这个座位上，翻开书正式上课.在这个现象中，“书本”充当了“占位符”的作用。  
在Ruby语言中，yield是占位符:先在前面的某部分代码中用yield把位置占着，然后才在后面的某个代码块(block)里真正实现它,从而完成对号入座的过程.   
定义find    
def find(dir)    
  Dir.entries(dir).each {|f| yield f} #获得dir目录下的文件名列表;对每个文件名,用yield来处理(至于怎么处理，还不知道，占个位置先^_^)    
end    
  
使用find    
find(".") do |f| #block开始    
  puts f  #用输出文件名这个语句，真正实现了yield的处理(也可以用任何其他语句)    
end #block结束    

由此可见，yield属于定义层，属于宣告层，也就是在心里说一句:"这个位置不错，我先用书本占了再说!";
而block属于使用层，实现层,也就是最终你坐在了你先前占的位置上，从而真正的实现了对号入座的过程.   
```

* **empty、nil、blank三者之间的区别**    

http://www.cnblogs.com/lmei/p/3262816.html     
```
这三个方法在ROR中经常用到，都是用来判断是否为空的。    

区别是：     

ruby的方法：.nil?、.empty?    

rails的方法 ：.blank?    

用法的区别：    

.nil?    :   判断对象是否存在。      
.empty? :   是对象已经存在，判断是否为空字段。    
.blank?  :   相当于同时满足 .nil? 和 .empty? 。     
注： Rails API中的解释是如果对象是：false, empty, 空白字符都是blank。     
比如说： "", " ", nil, [], 和{}都算是blank。   
也就是说，object.blank? 相当于 object.nil? || object.empty?     
.nil? 和 empty? 的简单例子   

true.blank?   #=> false
false.blank?  #=> true
"true".blank? #=> false
"".blank?     #=> true
"\n".blank?   #=> true
'\n'.blank?   #=> false
'true'.blank? #=> false
''.blank?     #=> true
1.blank?      #=> false
[].blank?     #=> true
[1].blank?    #=> false
```
* alias设置别名     
```
alias 别名  原名  #直接使用方法名
alias :别名 :原名 #使用符号名
除了为方法设置别名外，在重定义以存在的方法时，为了能用别名调用原来的方法，也需要用alias
```

----
#### **ruby中的布尔值**     

ruby中布尔值是一个特殊对象。它由两个类型组成TrueClass和FalseClass，可以在irb里试一下 true.class，这两个类型生成两个特殊的对象： true  和 false。

所有ruby中的对象都可以转成布尔值，nil是false，其他全部是true，当然false还是false。
在irb里试：puts "true" if nil，则不会打出 true，而是返回nil。

 0并不象想象中的那样是false，而是true.  可以在irb里试一下: puts "true" if 0 . 这会打印出true，说明0就是true，因为它是一个对象，ruby没有数字型的说法，而是一个对象。

在使用的时候，如果掌握不了这种灵活的用法，那么就注意几点就行了：        
1.使用同类型比较，返回的布尔值肯定是对的。比如： 0=="0" ，这是false。 0==0 就是true。       
2.不要直接取对象的布尔值。比如： 0 是true, "0" 也是 true， 而 0!=0 是false，如果判断非0一定要直接写 obj != 0 ，不能象c那样写。即使是判断nil，也用 obj.nil?，这样代码比较清晰。        
3.使用if ，弃用unless。如果你有时候会弄晕，那么为了保证安全，只用if ，即使是检查nil也不用unless。       
特别是你在多种语言间转来转去的时候。      
http://www.th7.cn/Program/c/201609/952039.shtml