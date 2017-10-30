[**return home**](Home)     

-----------------------------------------------------------------------------------------   

[TOC]

OS X EI Capitan Version 10.11.6 (15G31)

## **鼠标滚轮跟windos统一** 

1. 首先打开左上角全局菜单中的“偏好设置”     
2. 然后在偏好设置中找到“鼠标”点击进去     
3. 最后在“鼠标”设置中把“滚动方向：自然”前面的勾去掉就和windows中一样了。   

## **mac关闭开机声音**    

```
# 打开终端
# 关闭声音
$ sudo nvram SystemAudioVolume=%80
# 如果想要恢复正常的开机生硬，只要在终端中再次输入如下命令即可：
$ sudo nvram -d SystemAudioVolume

```    

## **ssh远程连接mac**   

mac 默认安装了openssh。    
依次代开系统设置－－共享，把remote login勾上，选择允许的用户，就ok了   
在共享里面可以看见ssh命令，看这个命令就可以了。    

* **终端无法使用小键盘**    

终端：偏好设置-->描述文件-->高级-->（去掉勾选）允许VT100应用程序小键盘模式    

## **Mac关闭自动更新app Store**  

1.用户必须先进入“系统偏好设置”，找到Mac app store：    
2.　点击进去之后就就能看到Mac App Store的更新设置，这个时候只需要把自动更新设置去掉即可：    

## **Dashboard**    
偏好设置 --> Mission Control --> Dashboard      
不是所有 Mac 上的工作都需要使用大型应用程式，有些简单的工作不妨让 [tiger] 上的新功能 Dashboard 来为您完成。只要按下一个键，半透明的 Dashboard 就会浮现在电脑桌面上，供您快速取用多种有趣又实用的迷你应用程式 widget。需要加减乘除吗？交给“计算机”widget 吧！想知道心爱的人所坐的班机飞到哪了吗？请看看 Flight Tracker widget。办公室没有窗户让您一窥外头的情况吗？打开 Weather widget 就知道现在窗外是什么天气。     
http://jingyan.baidu.com/article/066074d6910570c3c21cb0d9.html       

## **mac应用程序所在目录**   

硬盘名称(如macintoch HD) /Applications 硬盘点开就能看到一个叫应用程序的文件夹，直接安装或拖拽过去就可以了，   
http://jingyan.baidu.com/article/363872ecd5b8406e4aa16f5e.html     

## **mac应用程序快捷方式**   
1.在 Finder 中的应用程序中，找到想要创建快捷图标的应用程序     
2.随后请先按住键盘上的 option+command 键     
3.接着再把把想要在桌面上创建快捷方式的应用程序拖到桌面了，先松鼠标，当看到有一个快捷箭头以后再把 option+command 键松开。    
4.当创建了快捷方式成功以后，会看到应用程序图标左下方有一个箭头标志       

##find 进入特定目录    
find -> 前往 -> 前往文件夹，输入路径即可：     
`![WX20170320-132530.png](https://bitbucket.org/repo/oE6yEX/images/614659939-WX20170320-132530.png)`      

## mac 系统桌面背景图片位置    

/Library/Desktop Pictures/    

## **把应用程序图标放在finder上**    

按住 cmd键，鼠标拖动应用即可。   

## **显示与隐藏 隐藏文件**     


https://jingyan.baidu.com/article/d2b1d1027c6dc65c7e37d435.html     
命令行：    
```
defaults write com.apple.finder AppleShowAllFiles Yes && killall Finder //显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles No && killall Finder //不显示隐藏文件
```    

## Mac下的 tree 命令 终端展示你的目录树结构    

```
find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
```    

1. 打开 bash 配置文件,把上面命令拷贝粘贴进去   
```
vi ~/.bash_profile

#把下面命令复制到.bash_profile
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"   

# 保存后执行下面命令
source .bash_profile
``` 

直接安装tree工具：    
```
~ brew install tree

➜  /Users/zhangzhi/code/angular-phonecat git:(master) >brew install tree
==> Downloading http://mama.indstate.edu/users/ice/tree/src/tree-1.6.0.tgz
Already downloaded: /Library/Caches/Homebrew/tree-1.6.0.tgz
==> make prefix=/usr/local/Cellar/tree/1.6.0 MANDIR=/usr/local/Cellar/tree/1.6.0/share/man/man1 CC=c
🍺  /usr/local/Cellar/tree/1.6.0: 7 files, 140K, built in 2 seconds   

# 帮助查看
~ tree --help
```   


## Mac 右上角顶级菜单中图标管理   

### 1. 图标顺序管理    

按下Command然后用鼠标拖动图标即可调整顺序。   

### 2. 删除无用的图标    

搜狗输入法中有一个语音输入，导致在右上角有个 话筒的图标， 可在 搜狗输入法设置里把语音输入取消即可。