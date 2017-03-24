###  [**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)     
-----------------------------------------------------------------------------------------

# 知识点 #  

[ruby中include和extend以及模块中ClassMethods](https://bitbucket.org/yulilong/my_wiki/wiki/ruby%E4%B8%ADinclude%E5%92%8Cextend%E4%BB%A5%E5%8F%8A%E6%A8%A1%E5%9D%97%E4%B8%ADClassMethods%20)

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
* **类方法的定义：**

```
class HelloWorld
  def greet
  end
end

# class << 类名 ～ end
class << HelloWorld
  def hello
  end
end 

# class << self ~ end
class HelloWorld
  class << self
    def hello
    end
  end
end

# def 类名.方法名 ~ end
class << HelloWorld
  def HelloWorld.hello
  end
end 
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