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