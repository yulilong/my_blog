#git install
```
sudo yum update
sudo yum install -y git
```
# git命令别名设置 #
这里是为了在频繁git操作的时候，命令简化。
```
git config --global user.name "Michael Fan"
git config --global user.email fanlinsheng@gmail.com
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

# github Personal access tokens
这里是为下一步操作做准备的，如果你的仓库网站提供了token，那么设置以下，没有请忽略。

385f054bdcf8d95b4372c6e5199818388420c0fd

#git-credentials

这里是为了你在拉取代码的时候不用在输入用户名密码了，但是这里会暴露你远程仓库的用户名密码，如果有token那没有问题，如果没有，呵呵你自己看着办。
```
$ vim ~/.git-credentials
```
```
http://用户名:密码或token@仓库地址
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