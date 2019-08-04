# 概述 #
对于电脑或服务器没有代理的需要设置ruby gems镜像，如果有代理，但是安装速度慢，也可以设置此镜像来加快安装速度。     

## 淘宝镜像 ##
https://ruby.taobao.org/     
之前都是使用淘宝镜像2016-12-27发现淘宝的ruby gem 镜像已经重定向到ruby-china了，所以不多做介绍了。

## ruby-china镜像 ##
http://gems.ruby-china.org/     

* 如何使用？   

```
# 请尽可能用比较新的 RubyGems 版本，建议 2.6.x 以上。
$ gem update --system # 这里请翻墙一下
$ gem -v
2.6.3
```    
```
$ gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
$ gem sources -l
https://gems.ruby-china.org
# 确保只有 gems.ruby-china.org
```   

* 如果你使用 Gemfile 和 Bundle (例如：Rails 项目)

```
# 你可以用 Bundler 的 Gem 源代码镜像命令。
$ bundle config mirror.https://rubygems.org https://gems.ruby-china.org
# 这样你不用改你的 Gemfile 的 source。
source 'https://rubygems.org/'
gem 'rails', '4.2.5'
...
```