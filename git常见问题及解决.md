###  不同操作系统使用git时，换行操作不同问题     
![WX20170524-183615.png](https://bitbucket.org/repo/oE6yEX/images/2142324664-WX20170524-183615.png)     

错误信息类似于：   
```
~ git diff > tmp.patch
warning: LF will be replaced by CRLF in src/app/theme/components/menuItem/menuItem.component.css.
The file will have its original line endings in your working directory.
warning: LF will be replaced by CRLF in config/webpack.dev.js.

```

*  什么是CRLF和LF    

CRLF 是 carriage return line feed的缩写。中文意思是回车换行。      
LF是line feed的缩写，中文意思是换行。      
CRLF->Windows-style       
LF->Unix Style       
CR->Mac Style       
CRLF表示句尾使用回车换行两个字符(即我们常在Windows编程时使用"\r\n"换行)      
LF表示表示句尾，只使用换行.        
CR表示只使用回车.        

* 在Git中如何转换？     

在Git通过下面的命令配置:      
```
$git config --global core.autocrlf true
# Configure Git on Windows to properly handle line endings
```    
设置为true，添加文件到git仓库时，git将其视为文本文件。他将把crlf变成lf。      
设置为false时，line-endings将不做转换操作。文本文件保持原来的样子。      
设置为input时，添加文件git仓库石，git把crlf编程lf。当有人Check代码时还是lf方式。因此在window操作系统下，不要使用这个设置。      
1) true:             x -> LF -> CRLF         
2) input:            x -> LF -> LF            
3) false:            x -> x -> x         

*  其他的命令     

```
# AutoCRLF
#提交时转换为LF，检出时转换为CRLF
git config --global core.autocrlf true   
#提交时转换为LF，检出时不转换
git config --global core.autocrlf input   
#提交检出均不转换
git config --global core.autocrlf false

# SafeCRLF
#拒绝提交包含混合换行符的文件
git config --global core.safecrlf true   
#允许提交包含混合换行符的文件
git config --global core.safecrlf false    # 设置这个命令会把警告取消
#提交包含混合换行符的文件时给出警告
git config --global core.safecrlf warn

```  

* 参考链接    

http://itindex.net/detail/49247-crlf-lf?utm_source=tuicool&utm_medium=referral       
http://www.cnblogs.com/flying_bat/archive/2013/09/16/3324769.html         
crlf导致的git错误：      
http://blog.chinaunix.net/uid-8052635-id-4427001.html
```
在使用git的过程中，如果我们的项目是跨平台开发的
那么CRLF的处理也许会成为一个很头疼的事情，有可能会出以下的莫名其妙的问题：
我们的某个开发人员在linux上提交的一个文件
当从windows上pull下来后，没做任何的修改，查看其status，它的状态已经是modifed了
即使你使用git checkout -f来恢复改文件，它的状态仍然是modified，真是郁闷…
后来，才发现就是CRLF惹的祸  
# 解决  
在Linux上设置autocrlf为input，这样，Git在提交时把CRLF转换成LF，签出时不转换
对于从Windows上直接拷到Linux上的文件，首先把它转换成linux格式后，再进行提交

```

-------------