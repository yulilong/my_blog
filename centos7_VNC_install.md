## overview
　　VNC，全称为Virtual Network Computing，它是一个桌面共享系统。它的功能，类似于windows中的远程桌面功能。VNC使用了RFB(Remote FrameBuffer，远程帧缓冲）协议来实现远程控制另外一台计算机。它把键盘、鼠标动作发送到远程计算机，并把远程计算机的屏幕发回到本地。       

　　VNC技术与平台无关，VNC Viewer可以和VNC Server在不同的操作系统上。VNC几乎支持所有的操作系统，也支持Java，甚至可以通过支持Java的浏览器来访问VNC Server。多个VNC客户端可以同时连接到一个VNC Server上。     

* **参考链接**
CentOs 7安装配置VNC Server---[亲测]      
http://www.jianshu.com/p/35640fc5672b      

https://www.phpini.com/linux/centos-7-install-vnc-server                 
http://www.educity.cn/linux/1442864.html               

CentOS安装VNC Server远程桌面
http://www.metsky.com/archives/818.html    

* **安装VNCServer**    

```
# 试试服务器装了 VNC 没
$ rpm -q tigervnc tigervnc-server
# 如出现not installed说明没有安装 
#install VNC
$ yum install tigervnc tigervnc-server
```   

* **配置NVC**     

```
# 将/lib/systemd/system/vncserver@.service文件复制一份
$ cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
# 编辑刚刚我们复制得新文件，将文件中得<USER>修改成 VNC Client连接的账号
$ sudo vi /etc/systemd/system/vncserver@:1.service
#
```   
![WX20170306-164613.png](https://bitbucket.org/repo/oE6yEX/images/663789721-WX20170306-164613.png)