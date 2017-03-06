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
![WX20170306-163432.png](https://bitbucket.org/repo/oE6yEX/images/1350621553-WX20170306-163432.png)      


* **配置NVC**     

```
# 将/lib/systemd/system/vncserver@.service文件复制一份
$ cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
# 编辑刚刚我们复制得新文件，将文件中得<USER>修改成 VNC Client连接的账号
$ sudo vi /etc/systemd/system/vncserver@:1.service
```   
![WX20170306-164613.png](https://bitbucket.org/repo/oE6yEX/images/663789721-WX20170306-164613.png)      

* **设置VNCServer开机自启动**      

```
# 切换到root账号，开启VNCServer并设置开机自启
$ systemctl start vncserver@:1.service
$ systemctl enable vncserver@:1.service
```     

* **设置防火墙**     

最后，需要配置一下防火墙，允许VNC客户端连接VNC server。VNC server监听的端口从5900开始，display :1的监听5901，display :2监听5902，以此类推。CentOs的防火墙缺省是不允许连接这些端口的，所以需要使用下面的步骤打开防火墙（需要root权限)：    
```
# centos 默认使用的防火墙
$ firewall-cmd --permanent --add-service="vnc-server" --zone="public"
$ firewall-cmd --reload
```
![WX20170306-172041.png](https://bitbucket.org/repo/oE6yEX/images/2420996592-WX20170306-172041.png)       

* **开启VNCServer**       

```
$ vncserver
```

![WX20170306-172330.png](https://bitbucket.org/repo/oE6yEX/images/293260000-WX20170306-172330.png)      

* **其他电脑连接这台电脑**      



## VNC调试参考    

```  
1.查看VNC进程情况（如果有VNC启动窗口，列表中可看到）：
$ ps -ef|grep -i vnc
2.启动一个窗口
$ vncserver :1 
3.杀死一个桌面(注意kill后面有个空格)
$ vncserver -kill :1
$ rm -f  /tmp/.X1-lock
如果是其它桌面号，需要对应修改ID号。
4.修改VNC登录密码
$  vncpasswd 
```    

## 常见错误       

1、命令启动VNCServer报错      

$ systemctl start vncserver@:1.service     

报告如下错误：Job for vncserver@:1.service failed. See ‘systemctl status vncserver@:1.service’ and ‘journ alctl -xn’ for details.     

解决方法：修改配置文件 vncserver@:1.service 中 Type 为 simple     

修改完成后执行：      
$ systemctl daemon-reload      
$ systemctl start vncserver:1.service