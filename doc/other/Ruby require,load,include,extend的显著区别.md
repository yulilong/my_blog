## **require，load用于包含文件；include，extend则用于包含模块。**     

## **include,require,load的显著区别**     

http://www.cnblogs.com/mover/p/3686176.html     

1. require和load不同，它只加载文件一次，即在第一次执行到require时载入，以后碰到require同一文件时自动忽略，已经被加载的文件保存在`$”`中。    
2. require还可以用来加载二进制格式的库。Require可以使用绝对路径或相对路径，如果使用了相对路径，那么系统会在`$:`变量包含的目录中搜寻。    
3. Require和load的另一个不同是当包含文件是Ruby代码时，require可以不加后缀名。Require将当前所有加载的文件保存在$"变量中。   
4. 在Irb里用load比用require 好，load允许我们多次加载同一个文件，这样如果我们发现一个BUG后编辑文件，可以将它重新加载到Irb的会话中。    


总结：      
1. require, load,include都是Kernel模块中的方法，他们的区别如下：     
2. require，load用于包含文件，include则用于包含的模块。     
3. require加载一次，load可加载多次。       
4. require加载Ruby代码文件时可以不加后缀名，load加载代码文件时必须加后缀名。       
5. require一般情况下用于加载库文件，而load用于加载配置文件。       

load例子：    
```
#!ruby
4.times do |i|   
        File.open("temp.rb","w") do |f|   
            f.puts "def test"  
            f.puts "#{i}"  
            f.puts "end"  
        end  
        load "temp.rb"  
        puts test   
end   
执行结果为：
    0
    1
    2
    3 

```     

## 引用单个和目录下所有rb的方法    

http://blog.csdn.net/xuleilx/article/details/21830395      
`除引用系统rb外，require中不能用相对路径。`       
同一目录下的文件，如/usr/local/ruby/foo.rb与/usr/local/ruby/bar.rb两个文件。      
如果直接在foo.rb中：  
```
require 'bar'
```     
执行时会报找不到bar.rb错误。这是因为运行:      
```
/home/oldsong~ ruby /usr/local/ruby/foo.rb
```    
时会在ruby安装的lib目录和/home/oldsong/目录下查找bar.rb。而不会去rb文件的目录/usr/local/ruby/下查找。    
1、引用一个文件     
引用当前rb同目录下的file_to_require.rb    
```
require File.join(__FILE_, '../file_to_require')。
require File.expand_path('../file_to_require', __FILE__)
require File.dirname(__FILE__) + '/file_to_require'
```   
其中，File.expand_path是Rails常用的做法。
__FILE__为常量，表示当前文件的绝对路径，如/home/oldsong/test.rb      
还可以：    
```
$LOAD_PATH.unshift(File.dirname(__FILE__))  # 先把目录加入LOAD_PATH变量中，然后可直接引用文件名
require 'bar'
```    
2、引用一个目录下所有文件     
例：引用当前rb相同目录下lib/文件下所有*.rb文件。     
```
# 方法一
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }     
# 方法二
# 一个gem
# https://rubygems.org/gems/require_all
```

## **include和extend**    

http://blog.csdn.net/rocky_j2ee/article/details/3754781     
include主要用来将一个模块插入（mix）到一个类或者其它模块。      
extend 用来在一个对象（object，或者说是instance）中引入一个模块，这个类从而也具备了这个模块的方法。       
通常引用模块有以下3种情况：       
1.在类定义中引入模块，使模块中的方法成为类的实例方法       
这种情况是最常见的             
直接 include <module name>即可       

2.在类定义中引入模块，使模块中的方法成为类的类方法       
这种情况也是比较常见的       
直接 extend <module name>即可       

3.在类定义中引入模块，既希望引入实例方法，也希望引入类方法       
这个时候需要使用 include,       
但是在模块中对类方法的定义有不同，定义出现在 方法       
def self.included(c) ... end 中       

完整的示例如下：     
```
#!ruby
module Ma   
  MA_VALUE = 1  
  def ma_1   
    puts "it is ma_1"  
  end   
end   
  
module Mb   
  MB_VALUE = 1  
  def self.included(c)   
    def c.mb_2   
      puts "it is mb_2"  
    end   
  end   
  def mb_1   
    puts "it is mb_1"  
  end   
end   
  
class Ca   
  include Ma      
end   
     
class Cb   
  extend Ma   
  include Mb   
end   
  
c1 = Ca.new  
c1.ma_1   
  
c2 = Cb.new  
c2.mb_1   
Cb.ma_1   
Cb.mb_2   
  
puts Ma::MA_VALUE   
puts Ca::MA_VALUE   
  
puts Mb::MB_VALUE   
puts Cb::MB_VALUE  
```