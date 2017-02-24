###  [**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)     
-----------------------------------------------------------------------------------------

OS X EI Capitan Version 10.11.6 (15G31)

* **鼠标滚轮跟windos统一** 

1. 首先打开左上角全局菜单中的“偏好设置”     
2. 然后在偏好设置中找到“鼠标”点击进去     
3. 最后在“鼠标”设置中把“滚动方向：自然”前面的勾去掉就和windows中一样了。   

* **mac关闭开机声音**    

```
# 打开终端
# 关闭声音
$ sudo nvram SystemAudioVolume=%80
# 如果想要恢复正常的开机生硬，只要在终端中再次输入如下命令即可：
$ sudo nvram -d SystemAudioVolume

```    

* **ssh远程连接mac**   

mac 默认安装了openssh。    
依次代开系统设置－－共享，把remote login勾上，选择允许的用户，就ok了   
在共享里面可以看见ssh命令，看这个命令就可以了。    

* **终端无法使用小键盘**    

终端：偏好设置-->描述文件-->高级-->（去掉勾选）允许VT100应用程序小键盘模式    

* **Mac关闭自动更新app Store**  

1.用户必须先进入“系统偏好设置”，找到Mac app store：    
2.　点击进去之后就就能看到Mac App Store的更新设置，这个时候只需要把自动更新设置去掉即可：    

* **Dashboard**    
偏好设置 --> Mission Control --> Dashboard      
不是所有 Mac 上的工作都需要使用大型应用程式，有些简单的工作不妨让 [tiger] 上的新功能 Dashboard 来为您完成。只要按下一个键，半透明的 Dashboard 就会浮现在电脑桌面上，供您快速取用多种有趣又实用的迷你应用程式 widget。需要加减乘除吗？交给“计算机”widget 吧！想知道心爱的人所坐的班机飞到哪了吗？请看看 Flight Tracker widget。办公室没有窗户让您一窥外头的情况吗？打开 Weather widget 就知道现在窗外是什么天气。     
http://jingyan.baidu.com/article/066074d6910570c3c21cb0d9.html