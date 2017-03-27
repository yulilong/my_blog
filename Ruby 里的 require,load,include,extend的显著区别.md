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