# manageiq 环境一体化虚拟机下载 #
http://manageiq.org/download/     
在这里选好一个系统，如redhat，vmware虚拟机，这里下载好，可以直接在虚拟机中运行，环境已经搭配好。    
http://releases.manageiq.org/manageiq-ovirt-euwe-1.ova

# FileZilla的安装 #
服务器已经有了，此时需要把开发好的代码上传到服务器运行，使用filezilla软件可以连接服务器并修改文件。   

* centos系统下下载filezilla    

1.在 Application Installer 软件中心搜索 filezilla，如果能搜索出来，那么可以点击安装。     
2.如果没有那么在终端运行命令：    
```
## http://linux.it.net.cn/CentOS/course/2016/0401/20899.html  
$ sudo yum install –y filezilla
```     

## FileZilla的设置 ##

* 连接服务器    
打开软件后，输入host、username、password,port一般输入22，然后点快速连接。      
* 软件语言设置    
edit -> settings -> language，然后在里面找和中文(Chinese(Simplified)(zh_CN) )、英文。      
* 编辑.rb文件的编辑器设置    
编辑 -> 设置 -> 文件编辑 -> 文件格式关联，在里面添加：
```
rb /usr/bin/gedit
```   
## 确认服务器能够上网 ##
因为需要安装ruby gem包，所需需要确认能够联网：   
```
$ ping wwww.baidu.com
$ ping www.github.com
$ ping bitbucket.org
```  
如果不能上网：    

* 配置DNS地址     

http://jingyan.baidu.com/article/870c6fc32c028eb03fe4be30.html    

```
cd /etc/sysconfig/network-scripts
cp ifcfg-eth0 ifcfg-eth0.backup
vi ifcfg-eth0
# 修改里面DNS
DNS1=221.228.255.1   
```    
```
$ vi /etc/resolv.conf 
# 在里面添加下面三行
nameserver 221.228.255.1
nameserver 114.114.114.114
nameserver 8.8.88
```

## 服务器的代码更新 ##

使用FileZilla 输入用户名、密码、地址、端口(22)，链接，然后把代码上传上去，部分文件

