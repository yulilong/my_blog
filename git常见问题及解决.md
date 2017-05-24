###  CRLF和LF      

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