###ruby的class << self, 及其class_eval和instance_eval的区别
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
* 类方法的定义：

```
class HelloWorld
  def greet
  end
end
```
class << 类名 ～ end
```
class << HelloWorld
  def hello
  end
end 
```
class << self ~ end
```
class HelloWorld
  class << self
    def hello
    end
  end
end
```
def 类名.方法名 ~ end
```
class << HelloWorld
  def HelloWorld.hello
  end
end 
```
### ruby 中super和super()的区别
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

## ruby 类方法中 self.class.方法名
子类中方法调用父类中同名的方法
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