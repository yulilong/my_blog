## ruby 基础

### 1、each、map、collect的区别

each: 仅遍历数组，并做相应操作，数组本身不发生改变。

map:遍历数组，并做相应操作后，返回新数组(处理)，原数组不变。

collect: 跟map作用一样。

`collect!` `map!`: 多了一个作用，改变原数组。

```ruby
// 终端打开 irb
// each
a = [ "a", "b", "c", "d" ]
b = a.each { |x| x + "!" } 	// a == b == [ "a", "b", "c", "d" ]

// map map!
a = [ "a", "b", "c", "d" ]
b = a.map { |x| x + "!" }	
a	// ["a", "b", "c", "d"]
b	// ["a!", "b!", "c!", "d!"]
c = a.map! { |x| x + "!" }
a	// ["a!", "b!", "c!", "d!"]
c	// ["a!", "b!", "c!", "d!"]

// collect collect!
a = [ "a", "b", "c", "d" ]
b = a.collect { |x| x + "!" }	
a	// ["a", "b", "c", "d"]
b	// ["a!", "b!", "c!", "d!"]
c = a.collect! { |x| x + "!" }
a	// ["a!", "b!", "c!", "d!"]
c	// ["a!", "b!", "c!", "d!"]
```



### 2、Block, lambda, Proc 的区别

1. proc和lambda都是对象，而block不是

2. block是proc的实例，proc可以重复使用，函数参数只能有一个block，但可以有多个proc

   ```ruby
   # 说明block是proc的一个实例
   def what_am_i(&block)                                                                                 
       block.class
   end
   puts what_am_i {}  # =< Proc

   def multiple_procs(proc1, proc2)
     proc1.call
     proc2.call
   end
   a = Proc.new { puts "First proc" }
   b = Proc.new { puts "Second proc" }
   multiple_procs(a,b)
   ```

3. lambda会检查参数个数，proc不会。

   ```ruby
   lam = lambda { |x| puts x }    # creates a lambda that takes 1 argument
   lam.call(2)                    # prints out 2
   lam.call                       # ArgumentError: wrong number of arguments
   lam.call(1,2,3) 
   pro = Proc.new { |x| puts x } # creates a proc that takes 1 argument
   pro.call(2)                   # 2
   pro.call                      # returns nil
   pro.call(1,2,3)       		  # 1
   ```

4. lambda和proc对于return处理方式不同

   lambda：一个函数调用lambda，lambda里return后返回函数接着执行。

   proc: 一个函数调用proc，proc里return后， 函数也会return。

   ```ruby
   def lambda_test
     lam = lambda { return }
     lam.call
     puts "Hello world"
   end
   lambda_test
   def proc_test
     proc = Proc.new { return }
     proc.call
     puts "Hello world"
   end
   proc_test
   ```

参考资料：

[What Is the Difference Between a Block, a Proc, and a Lambda in Ruby?](http://awaxman11.github.io/blog/2013/08/05/what-is-the-difference-between-a-block/)

[浅谈Ruby中的block, proc, lambda, method object的区别](https://my.oschina.net/gschen/blog/325546)

### ruby中闭包

在Ruby里，如果该方法返回一个代码块，而该代码块获得了局部变量的引用，则这些局部变量将在方法返回后依然可以访问。

```
def show(name)
	count = 1;
	return proc do |value|
		puts count +=1;
		puts name + '我是闭包' + value
	end
end

sh = show("ruby")
sh.call('213')
sh.call('kkk')
```

参考：

[Ruby的4种闭包：blocks, Procs, lambdas 和 Methods](https://blog.csdn.net/dazhi_100/article/details/36696933)

### 3、alias 的用法, alias 与 alias_method 的区别

alias: 给已经存在的方法或变量设置一个别名，在重新定义已存在的方法时，还可以通过别名来调用原来的方法。

alias_method: 和alias类似，但只能给方法起别名，是Module的一个私有实例方法。

```ruby
class Demo 
  def hello
    puts "old_hell0"
  end
  # 给hello方法取别名
  # alias old_hello hello
  alias_method :old_hello, :hello
  def hello
    puts "new_hello"
  end
end
obj = Demo.new
obj.hello
obj.old_hello

```

参考：

 https://www.cnblogs.com/smallbottle/p/3968704.html

https://ruby-china.org/topics/27747

### 4、Ruby的对象体系

```
                   +------------+
                   | BasicObject|
                   +------------+
                        ^
                        |superclass
                        |
                   +----+-----+   superclass-----------+
                   |  Object  | ^----------|   Module  |
                   +----+-----+------+     +-+---------+
                        ^            |       ^
                        |superclass  |       |Superclass
                        |            |       |
+---------+           +-+-------+    +---> +-+-------+
| 'hello' |  class    | String  | class    | Class   |
|         +---------->+         +--------->+         +------>
+---------+           +---------+          +----+----+      |
                                                ^           |
                                                |  class    |
                                                <-----------+
```

`![](https://img-blog.csdn.net/20160413232121267?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)`

```ruby
'hello'.class		# String
String.class		# Class
String.superclass	# Object
Class.class			# Class
Class.superclass	# Module
Module.class		# Class
Module.superclass	# Object
Object.class		# Object
Object.superclass	# BasicObject
BasicObject.class	# Class
BasicObject.superclass	# nil
```

Module是Class的父类，Class和Module的差别是Class是一个增强的Module，它比Module多了一个new，allocate方法，除了这一个区别，当然这个区别特别重要，Class和Module基本是一样的。

参考： https://blog.csdn.net/feigeswjtu/article/details/51040006



### 5、 Include, Extend, Load, Require 的使用区别

- include和extend用于在类中引入模块，区别：

> include：把模块中的方法作为类的实例方法
>
> extend: 把模块中的方法作为类的类方法

```ruby
module A
	def class_type
		puts "This class is of type:#{self.class}"
	end
end
class B extend A end
class C include A end
B.class_type
C.new.class_type
```

- require、load用于加载库，如`.rb`文件，区别：

  > require: 加载一个库，并且只加载一次，如果多次加载会返回false。文件不需要扩展名
  >
  > load: 加载一个库，可多次加载。需要指定文件扩展名。

  ```ruby
  # 在当前目录中有一个 two.rb文件
  require './two';
  load './two.rb';
  ```

### 6、yield、yield self

所有的方法(methods)都会隐式的带一个块(block)参数。

- yield用来执行块参数，也可以通过call()方法执行。

  yield 相当于是 block.call() 方法的调用，所以参数个数也需要对应, method 定义中 &block 参数必须在最后

  ```ruby
  def foo1()
      yield 1,2,3     # 这里的 1 2 3 就是传递的参数
  end
  def foo2(time, &block)
      yield 1, 2, 3
      block.call(5, 6, 7)  
      puts time
  end
  foo1 {|x,y,z| puts z}    # => 3
  foo2('2018') {|x,y,z| puts z}    # => 3 7 2018
  ```

- yield self

  在一个对象中，self 表示是一个当前对象的引用。

  `yield self if block_given?` 相当于如果有块参数，那个调用快参数，参数是自己。

  ```ruby
  def foo(&block)
      puts self
      yield self if block_given?
      yield "AAAAAAAAA"
  end
  foo {|x| puts x}
  foo
  ```

参考链接：https://www.cnblogs.com/licongyu/p/5522027.html

### 7、 Ruby中的元编程

Ruby中的元编程，是可以在运行时动态地操作语言结构（如类、模块、实例变量等）的技术。你甚至于可以在不用重启的情况下，在运行时直接键入一段新的Ruby代码，并执行它。

　　Ruby的元编程，也具有“利用代码来编写代码”的作用。例如，常见的`attr_accessor`等方法就是如此。

####  7.1 实例变量、方法、类

- 同一个类的实例可以有不同的实例变量，因为实例变量只有使用的时候才会被建立。
- 匿名类：对一个具体对象添加方法是，ruby会插入一个新的匿名类来容纳新建的方法，匿名类不可见。
- `def initialize(*args)`: 方法可以通过参数不同执行不同的操作

#### 7.2 send、eval、respond_to?

- send

  > `send`是`Object`类的实例方法。第一个参数是方法名，后面是方法的参数
  >
  > 使用`send`方法，你所想要调用的方法就顺理成章的变成了一个普通的参数。你可以在运行时，直至最后一刻自由决定到底调用哪个方法。

  ```ruby
  class Rubyist
    def welcome(*args)
      "Welcome " + args.join(' ')
    end
  end
  obj = Rubyist.new
  puts(obj.send(:welcome, "hello", "world")) 
  ```

- eval

  > 用于执行一个用字符串表示的代码,`eval`方法可以计算多行代码，使得将整个程序代码嵌入到字符串中并执行成为了可能。`eval`方法很慢，在执行字符串前最好对其预先求值。

  ```
  str = "Hello"
  puts eval("str + ' world'") # => "Hello world"
  ```

- respond_to?

  > 所有的对象都有此方法，使用`respond_to?`方法，你可以确定对象是否能使用指定的方法。

  ```ruby
  obj = Object.new
  if obj.respond_to?(:program)
    obj.program
  else
    puts "Sorry, the object doesn't understand the 'program' message."
  end
  ```

  参考资料：http://deathking.github.io/metaprogramming-in-ruby/chapter04.html

参考资料：

[Ruby中的元编程](http://deathking.github.io/metaprogramming-in-ruby/)

### 8、全局变量，实例变量，局部变量，类变量，Symbol



| 格式         | 名称     | 作用范围                                             | 举例     |
| ------------ | -------- | ---------------------------------------------------- | -------- |
| `$`开头      | 全局变量 | 从定义到程序结束                                     | `$name`  |
| `@`开头      | 实例变量 | self                                                 | `@name`  |
| `@@`开头     | 类变量   | 内部直接用，外部用`类名::变量名`                     | `@@name` |
| `[a-z_]`开头 | 局部变量 | 定义的类、模块、方法内部，在类、模块、方法间不能共享 | `name`   |
| `[A-Z]`      | 常量     | 内部、外部均可，外部访问`类名::常量名`               | `NAME`   |
| `:`开头      | Symbol   | 内外                                                 | :name    |

参考资料：https://blog.csdn.net/emerald0106/article/details/7358766















## 其他面试题

https://www.jianshu.com/p/cc9f521d72ee

