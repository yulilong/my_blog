#rvm isntall
https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-centos-6-with-rvm

* rvm install:
```
$ sudo yum update
$ sudo yum install curl
$ curl -L get.rvm.io | bash -s stable
如果提示缺少密钥，那么按照提示安装密钥
$ source ~/.profile
$ rvm -v
如果出现版本，那么说明安装成功。
```
* ruby install:
```
$ rvm list known
选一个版本
$ rvm install 2.3.0
$ rvm use 2.3.0 --default
$ echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >>~/.bashrc
$ source ~/.bashrc
$ ruby -v
如果出现版本，那么说明安装成功。
```
```
ps:
/etc/profile:此文件为系统的每个用户设置环境信息,当用户第一次登录时,该文件被执行.并从/etc/profile.d目录的配置文件中搜集shell的设置.
/etc/bashrc:为每一个运行bash shell的用户执行此文件.当bash shell被打开时,该文件被读取.
~/.bash_profile:每个用户都可使用该文件输入专用于自己使用的shell信息,当用户登录时,该文件仅仅执行一次!默认情况下,他设置一些环境变量,执行用户的.bashrc文件.
~/.bashrc:该文件包含专用于你的bash shell的bash信息,当登录时以及每次打开新的shell时该文件被读取.
~/.bash_logout:当每次退出系统(退出bash shell)时,执行该文件.
```

* Install RubyGems:
```
$ rvm rubygems current
$ rvm -v
如果出现版本，那么说明安装成功。
```
* Install Rails
```
$ gem install rails
$ rails -v
如果出现版本，那么说明安装成功。
```



