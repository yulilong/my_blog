[**return Home**](Home)       

----------------
[TOC]

-----------------
## 1. GIT介绍

git是一个分布式版本控制软件，与常用的版本控制工具如CVS、Subversion不同，支持离线开发，离线存储。强大的分支功能，适合多个独立开发者协作。速度块。           
如果拥有CVS或者SVN的使用背景，那么更熟悉的方法是客户端-服务器端模式，所有的文件仓库(repository)都是存放在服务器上的，用户需要在本地安装客户端去服务器上的项目中获取旧版本，提交新版本。GIT抛弃了这种模式，当用户从远端GIT仓库下载一个工程(project)时，这个工程的所有文件，包括版本历史，文件改动都会下载下来，这时 候本地GIT就演变成了一个服务器，所有的提交(check-in)、提出(check-out)都会在这个本地服务器上执行，当你确定一项修改之后，可 以再和远端仓库进行合并和同步(merge)。所以，GIT的安装和配置步骤无论在本机还是服务器上都是完全一样的。

## 2. 使用GIT的好处

* 更顺畅的工作流程，开发过程中，完全可以离线操作     
* 快速，Git分布式架构使得本地仓库包含所有的历史版本信息，你可以在不同的版之间快速切换       
* 弹性的本地分支，在svn下，你建一个分支需要把源代码复制到另外一个文件夹，而在Git下，创建分支的代价是非常小的，只需一条命令
* 仓库目录结构简洁，用Git复制一个项目，只会在项目根目录创建一个.git的目录，而其他目录很干净       
* 内容按原数据方式存储，所有的版本信息都位于.git目录下     
* 完整性好，更易于协作开发        
* 用户群大，现在已经有成千上万个开源项目采用Git来做项目管理，github上更是有无数个代码仓库      

参考链接： http://blog.csdn.net/fyx708711/article/details/52606252

## 3. GIT 安装    

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

## 4. GIT 配置

### 4.1 GIT 初始化设置、命令别名设置      

这里是为了在频繁git操作的时候，命令简化。
```   
# linux,  Mac OS, window 都适用 
# https://git-scm.com/book/zh/v2/起步-初次运行-Git-前的配置
# https://git-scm.com/book/zh/v2/自定义-Git-配置-Git
git config --global user.name "you name"                 # 设置GIT的用户名 
git config --global user.email you_email_addr@gmail.com  # 设置GIT的邮箱

git config --global core.mergeoptions --no-edit          # 关闭git pull产生的merge信息
git config --global commit.template ~/.gitmessage.txt    # git 提交时编辑里面的模板
# false：关闭， auto：自动，有的颜色会忽略， always：忽略掉管道和终端的不同，即在任何情况下着色输出
git config --global color.ui false                       # 终端内容着色
git config --list                                        # 查看上面的配置

// 必要的配置
git config --global core.editor vim                      # 使用VIM编辑器编辑作为GIT的默认编辑器
git config --global credential.helper store              # 存储credential(凭证)，自动保存远程仓库账号密码
// https://git-scm.com/book/zh/v2/Git-工具-凭证存储
git config --global core.quotepath false                 # 关闭对0x80以上的字符进行quote， 解决git的中文乱码问题。
git config --global core.autocrlf true                   # 自动转换LF和CRLF(不同操作系统换行不同问题)。
git config core.ignorecase false						 # 设置git识别大小写
// git命令使用别名简化
git config --global alias.co checkout                    # GIT命令别名 方便操作快捷
git config --global alias.ci commit                      # GIT命令别名 方便操作快捷
git config --global alias.st status                      # GIT命令别名 方便操作快捷
git config --global alias.br branch                      # GIT命令别名 方便操作快捷
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global alias.type 'cat-file -t'             # GIT命令别名 方便操作快捷
git config --global alias.dump 'cat-file -p'             # GIT命令别名 方便操作快捷

# 查看git路径
which git
```



### 4.2 如果终端安装了oh-my-zsh，会带一堆git命令别名

Mac 用户和 Linux 用户通过在您的终端中运行以下命令来安装oh-my-zsh：

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

oh-my-zsh带的git命令别名：

```
g - git
gst - git status
gl - git pull
gup - git pull --rebase
gp - git push
gd - git diff
gdc - git diff --cached
gdv - git diff -w "$@" | view
gc - git commit -v
gc! - git commit -v --amend
gca - git commit -v -a
gca! - git commit -v -a --amend
gcmsg - git commit -m
gco - git checkout
gcm - git checkout master
gr - git remote
grv - git remote -v
grmv - git remote rename
grrm - git remote remove
gsetr - git remote set-url
grup - git remote update
grbi - git rebase -i
grbc - git rebase --continue
grba - git rebase --abort
gb - git branch
gba - git branch -a
gcount - git shortlog -sn
gcl - git config --list
gcp - git cherry-pick
glg - git log --stat --max-count=10
glgg - git log --graph --max-count=10
glgga - git log --graph --decorate --all
glo - git log --oneline --decorate --color
glog - git log --oneline --decorate --color --graph
gss - git status -s
ga - git add
gm - git merge
grh - git reset HEAD
grhh - git reset HEAD --hard
gclean - git reset --hard && git clean -dfx
gwc - git whatchanged -p --abbrev-commit --pretty=medium
gsts - git stash show --text
gsta - git stash
gstp - git stash pop
gstd - git stash drop
ggpull - git pull origin $(current_branch)
ggpur - git pull --rebase origin $(current_branch)
ggpush - git push origin $(current_branch)
ggpnp - git pull origin $(current_branch) && git push origin $(current_branch)
glp - _git_log_prettily
```

参考资料：

https://segmentfault.com/a/1190000007145316

https://www.hinjin.com/2018/04/13/%E5%A6%82%E4%BD%95%E5%8A%A0%E5%BF%AB%E4%BD%A0%E7%9A%84git%E6%93%8D%E4%BD%9C%EF%BC%9F/



### 4.3 GIT配置文件介绍      

* Linux，Mac OS         

Git 使用一系列配置文件来保存你自定义的行为。     
它首先会查找 /etc/gitconfig 文件，该文件含有系统里每位用户及他们所拥有的仓库的配置值。 如果你传递 --system 选项给 git config，它就会读写该文件。            
接下来 Git 会查找每个用户的 ~/.gitconfig 文件（或者 ~/.config/git/config 文件）。 你可以传递 --global 选项让 Git 读写该文件。           
最后 Git 会查找你正在操作的版本库所对应的 Git 目录下的配置文件（.git/config）。 这个文件中的值只对该版本库有效。        
以上三个层次中每层的配置（系统、全局、本地）都会覆盖掉上一层次的配置，所以 .git/config 中的值会覆盖掉 /etc/gitconfig 中所对应的值。     

* windows    
  

windows7系统：   C:\Documents and Settings\用户名，其中有一个.gitconfig的文件。      
windows8系统： C盘 -> 用户(Users) -> 用户名 文件夹下，有个.gitconfig的文件。         

在上述那个目录底下， 可发现另外一个文件.git-credentials，里面记录的就是用户名密码了。

---

## 5. git设置远程仓库账号密码(拉取、上传代码不用输入用户名密码)

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
## 6. git文件夹详解     

* [**探索.git目录**](http://www.cnblogs.com/zhongxinWang/p/4235448.html)     

* [**.git文件夹详解**](http://www.jianshu.com/p/25293009f738)     
* [**Git 内部原理**](https://git-scm.com/book/zh/v2/Git-%E5%86%85%E9%83%A8%E5%8E%9F%E7%90%86-%E5%BA%95%E5%B1%82%E5%91%BD%E4%BB%A4%E5%92%8C%E9%AB%98%E5%B1%82%E5%91%BD%E4%BB%A4)      

## 7. git常用命令 

[git常用命令](https://bitbucket.org/yulilong/my_wiki/wiki/git%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4)* [链接文本](链接网址)