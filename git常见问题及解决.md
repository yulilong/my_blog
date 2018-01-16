***目录*** 

[TOC]

--------------------------
##  不同操作系统使用git时，CRLF的处理换行问题   
     
![WX20170524-183615.png](https://bitbucket.org/repo/oE6yEX/images/2142324664-WX20170524-183615.png)     

错误信息类似于：   
```
# https://git-scm.com/book/zh/v2/自定义-Git-配置-Git
~ git diff > tmp.patch
warning: LF will be replaced by CRLF in src/app/theme/components/menuItem/menuItem.component.css.
The file will have its original line endings in your working directory.
warning: LF will be replaced by CRLF in config/webpack.dev.js.

```

###  1. 什么是CRLF和LF    

CRLF 是 carriage return line feed的缩写。中文意思是回车换行。      
LF是line feed的缩写，中文意思是换行。      
CRLF->Windows-style       
LF->Unix Style       
CR->Mac Style       
CRLF表示句尾使用回车换行两个字符(即我们常在Windows编程时使用"\r\n"换行)      
LF表示表示句尾，只使用换行.        
CR表示只使用回车.        

### 2. 在Git中设置自动转换     

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

-------------    

## 多个仓库相同代码推送被拒绝     

当添加一个仓库后，推送文件上去不允许,错误信息类似于：    

```
git push github master 
To https://github.com/user/my_wiki.wiki.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/user/my_wiki.wiki.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```    

如果远程仓库的代码没用了，不要了，则可以选择强推代码解决问题：    

```
~ git push -u github master -f
```      


## 由于Mac电脑升级导致 git不能用   

使用git的时候出现类似下面的信息：   

```
xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun
```


解决方法,终端下输入下面命令：   

```
xcode-select --install
```  

需要安装一会就可以了。     

## git使用vi编辑器时候报错：Swap file "./.git/.COMMIT_EDITMSG.swp" already exists!       

非正常关闭vi编辑器时会生成一个.swp文件。     
使用vi，经常可以看到swp这个文件,那这个文件是怎么产生的呢，当你打开一个文件，     
vi就会生成这么一个.(filename)swp文件 以备不测（不测下面讨论），如果你正常退出，那么这个这个swp文件将会自动删除 。   
swp文件的来历，当你强行关闭vi时，比如电源突然断掉或者你使用了Ctrl+ZZ，vi自动生成一个.swp文件，     
下次你再编辑时，就会出现一些提示。    

比如你正在使用`vi`编辑`file.txt`文件，然后强制关闭终端，这个时候就会产生`.file.txt.swp`文件。  
当再次使用`vi`打开`file.txt`文件就会出现提示， 这个时候可使用下面的命令来恢复未保存的操作：   

```
vi -r file.txt 
```   

这个时候保存中断之前的操作后，`.swp`文件不会自动删除，需要自己手动删除： 

```
rm .file.txt.swp
```    

## Git中文乱码的问题    

在使用git命令的时候，如果文件名是中文的，就会出现如`\200\273\347\273\223.png`的乱码。
解决方法，在终端中输入如下命令：   

```
git config --global core.quotepath false
```   

core.quotepath设为false的话，就不会对0x80以上的字符进行quote。中文显示正常。      

![](https://bitbucket.org/repo/oE6yEX/images/2932686307-WX20180116-170256@2x.png)    

参考链接： http://blog.csdn.net/tyro_java/article/details/53439537