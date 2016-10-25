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
$ ruby -v
如果出现版本，那么说明安装成功。
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



