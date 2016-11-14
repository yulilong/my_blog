# manqgeiq官方的安装文档 #

链接：  
http://manageiq.org/docs/guides/developer_setup.html  
你可以看这个官方的安装文档，这里面依赖环境安装是使用dnf管理其来安装的，我个人安装的时候会有点问题，你可以先尝试安装，如果有问题不能解决，那么可以看下面的安装教程。

# 根据官方文档自定义安装 #

## 概述review ##

这个是文档是从一个空白电脑开始安装，如果你哪一步已经存在，请略过

## 操作系统安装 ##

manageiq要求是 centos的 linux，所以请安装centos版linux，不会请找运维的同事或者网管安装。
推荐centos7

## git安装 ##

一般git linux系统自带，可在终端运行如下命令查看系统是否安装了git：
```
$ git --version
```
如果出来版本号则说明已经安装了，如果没有安装请看如下教程安装：  
* [git安装、配置](https://bitbucket.org/yulilong/my_wiki/wiki/git%E5%AE%89%E8%A3%85%E3%80%81%E9%85%8D%E7%BD%AE)  
这里面描写了git的安装、git命令的别名、以及拉取代码时自动验证用户名密码设置。

