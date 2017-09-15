[**return Home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)       

----------------
[TOC]     

-----------------      
## **1. GIT介绍**
 
git是一个分布式版本控制软件，与常用的版本控制工具如CVS、Subversion不同，支持离线开发，离线Repositor。强大的分支功能，适合多个独立开发者协作。速度块。           
如果拥有CVS或者SVN的使用背景，那么更熟悉的方法是客户端-服务器端模式，所有的文件仓库(repository)都是存放在服务器上的，用户需要在本地安装客户端去服务器上的项目中获取旧版本，提交新版本。GIT抛弃了这种模式，当用户从远端GIT仓库下载一个工程(project)时，这个工程的所有文件，包括版本历史，文件改动都会下载下来，这时 候本地GIT就演变成了一个服务器，所有的提交(check-in)、提出(check-out)都会在这个本地服务器上执行，当你确定一项修改之后，可 以再和远端仓库进行合并和同步(merge)。所以，GIT的安装和配置步骤无论在本机还是服务器上都是完全一样的。

## **2. 使用GIT的好处**

* 更顺畅的工作流程，开发过程中，完全可以离线操作     
* 快速，Git分布式架构使得本地仓库包含所有的历史版本信息，你可以在不同的版之间快速切换       
* 弹性的本地分支，在svn下，你建一个分支需要把源代码复制到另外一个文件夹，而在Git下，创建分支的代价是非常小的，只需一条命令
* 仓库目录结构简洁，用Git复制一个项目，只会在项目根目录创建一个.git的目录，而其他目录很干净       
* 内容按原数据方式存储，所有的版本信息都位于.git目录下     
* 完整性好，更易于协作开发        
* 用户群大，现在已经有成千上万个开源项目采用Git来做项目管理，github上更是有无数个代码仓库      


## **3. GIT 安装**    

https://git-scm.com/book/zh/v2/起步-安装-Git         
```   
# centos7.2 linnux
sudo yum update
sudo yum install -y git

# ubuntu 安装
# http://www.linuxidc.com/Linux/2016-09/135527.htm
sudo apt-get install git

# Mac OS 需要事先安装了homebrew  
~ brew install git

# windows 下 
# 下载客户端安装：
https://git-for-windows.github.io/
# 安装教程
# https://jingyan.baidu.com/article/20095761b48041cb0721b4fc.html
```

## git命令别名设置      

这里是为了在频繁git操作的时候，命令简化。
```   
# linux,  Mac OS, window 都适用 
# https://git-scm.com/book/zh/v2/起步-初次运行-Git-前的配置
# https://git-scm.com/book/zh/v2/自定义-Git-配置-Git
git config --global user.name "you name"
git config --global user.email you_email_addr@gmail.com
git config --global core.editor vim                      #使用VIM编辑器编辑作为默认编辑器
git config --global core.mergeoptions --no-edit          #关闭git pull产生的merge信息
git config --global commit.template ~/.gitmessage.txt    # git 提交时编辑里面的模板
# false：关闭， auto：自动，有的颜色会忽略， always：忽略掉管道和终端的不同，即在任何情况下着色输出
git config --global color.ui false                       # 终端内容着色
git config --global credential.helper store
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --list
# 查看git路径
which git
```     
Linux，Mac OS：      
Git 使用一系列配置文件来保存你自定义的行为。     
它首先会查找 /etc/gitconfig 文件，该文件含有系统里每位用户及他们所拥有的仓库的配置值。 如果你传递 --system 选项给 git config，它就会读写该文件。            
接下来 Git 会查找每个用户的 ~/.gitconfig 文件（或者 ~/.config/git/config 文件）。 你可以传递 --global 选项让 Git 读写该文件。           
最后 Git 会查找你正在操作的版本库所对应的 Git 目录下的配置文件（.git/config）。 这个文件中的值只对该版本库有效。        
以上三个层次中每层的配置（系统、全局、本地）都会覆盖掉上一层次的配置，所以 .git/config 中的值会覆盖掉 /etc/gitconfig 中所对应的值。     
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