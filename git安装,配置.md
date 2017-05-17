###  [**return Home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)    
#git install
```   
# centos7.2 linnux
sudo yum update
sudo yum install -y git
# Mac OS 需要事先安装了homebrew  
~ brew install git
```
# git命令别名设置 #
这里是为了在频繁git操作的时候，命令简化。
```   
# linux,  Mac OS, window 都适用 
git config --global user.name "you name"
git config --global user.email you_email_addr@gmail.com
git config --global core.editor vim              #使用VIM编辑器编辑commit信息
git config --global core.mergeoptions --no-edit  #关闭git pull产生的merge信息
git config --global credential.helper store
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --list
```     
Linux，Mac OS：      
Git有一个工具被称为git config，它允许你获得和设置配置变量；这些变量可以控制Git的外观和操作的各个方面。这些变量可以被存储在三个不同的位置：  
　　1./etc/gitconfig 文件：包含了适用于系统所有用户和所有库的值。如果你传递参数选项’--system’ 给 git config，它将明确的读和写这个文件。    
　　2.~/.gitconfig 文件 ：具体到你的用户。你可以通过传递--global 选项使Git 读或写这个特定的文件。      
 　　3.位于git目录的config文件 (也就是 .git/config) ：无论你当前在用的库是什么，特定指向该单一的库。每个级别重写前一个级别的值。因此，在.git/config中的值覆盖了在/etc/gitconfig中的同一个值。     
   
windows:     
C:\Documents and Settings\用户名，其中有一个.gitconfig的文件      

在上述那个目录底下， 可发现另外一个文件.git-credentials，里面记录的就是用户名密码了。

---

## git设置远程仓库账号密码(拉取、上传代码不用输入用户名密码)

* **github Personal access tokens**     

使用token可以不需要密码就可以读取远程仓库代码，如果你的远程仓库网站提供了账户访问token，那么设置一个读取token，没有tokens的请忽略。
https://github.com/settings/tokens     
`![WX20170421-105344.png](https://bitbucket.org/repo/oE6yEX/images/964748538-WX20170421-105344.png)`      

* **git-credentials git读取账号密码文件**

这里是为了你在拉取代码的时候不用在输入用户名密码了，
但是这里会暴露你远程仓库的用户名密码，注意保密，如果电脑不用了记得删除这个文件。
```
# 打开文件，如果没有则会自动创建文件
$ vim ~/.git-credentials
# 编辑好文件后运行git命令来让文件生效
$ git config --global credential.helper store
```    
里面文件内容：      
```
http://用户名:密码或token@仓库地址
http://yulilong:password@192.168.102.9
https://yulilong:password@bitbucket.org
http://yulilong:password@bitbucket.org
https://yulilong:5199818388420@github.com
http://yulilong:github_Personal_access_tokens@github.com
```

------------
## .git文件夹详解     

* [**探索.git目录**](http://www.cnblogs.com/zhongxinWang/p/4235448.html)     

* [**.git文件夹详解**](http://www.jianshu.com/p/25293009f738)     
* [**Git 内部原理**](https://git-scm.com/book/zh/v2/Git-%E5%86%85%E9%83%A8%E5%8E%9F%E7%90%86-%E5%BA%95%E5%B1%82%E5%91%BD%E4%BB%A4%E5%92%8C%E9%AB%98%E5%B1%82%E5%91%BD%E4%BB%A4)      

## git常用命令 ##

[git常用命令](https://bitbucket.org/yulilong/my_wiki/wiki/git%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4)* [链接文本](链接网址)