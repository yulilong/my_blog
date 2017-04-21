###  [**return Home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)    
#git install
```
sudo yum update
sudo yum install -y git
```
# git命令别名设置 #
这里是为了在频繁git操作的时候，命令简化。
```   
# linux,  Mac OS, window 都适用 
git config --global user.name "you name"
git config --global user.email you_email_addr@gmail.com
git config --global core.editor vim
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

# github Personal access tokens
这里是为下一步操作做准备的，如果你的仓库网站提供了token，那么设置一个读取token，没有tokens的请忽略。

385f054bdcf8d95b4372c6e5199818388420c0fd

#git-credentials

这里是为了你在拉取代码的时候不用在输入用户名密码了，但是这里会暴露你远程仓库的用户名密码，如果有token那没有问题，如果没有，呵呵你自己看着办。
```
$ vim ~/.git-credentials
```
```
http://用户名:密码或token@仓库地址

http://yulilong:password@192.168.102.9
https://yulilong:password@bitbucket.org
http://yulilong:password@bitbucket.org
https://yulilong:385f054bdcf8d95b4372c6e5199818388420c0fd@github.com
http://yulilong:385f054bdcf8d95b4372c6e5199818388420c0fd@github.com
```
```
$ git config --global credential.helper store
```

## git命令指导 ##

[git命令指导](https://bitbucket.org/yulilong/my_wiki/wiki/git%E5%91%BD%E4%BB%A4%E6%8C%87%E5%AF%BC)