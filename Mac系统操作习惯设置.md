[**return home**](Home)     

-----------------------------------------------------------------------------------------

[TOC]

OS X EI Capitan Version 10.11.6 (15G31)   

## 一、finder与文件相关操作

### 1、finder 进入特定目录

finder左上角的菜单中
finder -> 前往(go) -> 前往文件夹(go to folder)，输入路径即可：     
`![](https://bitbucket.org/repo/oE6yEX/images/614659939-WX20170320-132530.png)`      

### 2、finder中标题栏显示全路径

打开终端输入如下命令：  

```
// finder中标题栏显示全路径
~ defaults write com.apple.finder _FXShowPosixPathInTitle -bool TRUE;killall Finder
// finder中标题栏只显示文件夹名字
~ defaults delete com.apple.finder _FXShowPosixPathInTitle;killall Finder
```

`![](https://bitbucket.org/repo/oE6yEX/images/3179645349-WX20180209.png)`    

### 3、.DS_Store文件(禁止自动生成、删除、取消禁止生成)

.DS_Store是Mac OS保存文件夹的自定义属性的隐藏文件，如文件的图标位置或背景色，相当于Windows的desktop.ini。     

- 3.1. 禁止 .DS_Store 生成

打开 “终端” ，复制黏贴下面的命令，回车执行，重启Mac即可生效。    

```
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
```

- 3.2. 恢复 .DS_Store 生成

终端输入下面命令： 

```
defaults delete com.apple.desktopservices DSDontWriteNetworkStores
```

- 3.3. 删除所有的 .DS_Store 文件

在terminal中输入以下代码，可以删除所有.DS_Store文件      

```
sudo find / -name ".DS_Store" -depth -exec rm {} \;
```

- 3.4. 上面命令不管用，安装 App 解决 .DS_Store 污染问题

安装 Asepsis (https://asepsis.binaryage.com/) 可以解决这个问题，不过该 App 目前不开发了。      
ASEPSIS 会把所有的.DS_Store重定向到 /usr/local/.dscage 内。    

### 4、把应用程序图标放在finder上

按住 cmd键，鼠标拖动应用即可。   

## 二、Mac系统相关



### 1、鼠标滚轮跟windos统一 

1. 首先打开左上角全局菜单中的“偏好设置”     
2. 然后在偏好设置中找到“鼠标”点击进去     
3. 最后在“鼠标”设置中把“滚动方向：自然”前面的勾去掉就和windows中一样了。   

### 2、mac关闭开机声音    

```
# 打开终端
# 关闭声音
$ sudo nvram SystemAudioVolume=%80
# 如果想要恢复正常的开机生硬，只要在终端中再次输入如下命令即可：
$ sudo nvram -d SystemAudioVolume

```

### 3、关闭自动更新app Store

1. 用户必须先进入“系统偏好设置”，找到Mac app store。
2. 点击进去之后就就能看到Mac App Store的更新设置，这个时候只需要把自动更新设置去掉即可。

### 11 删除正在从app store下载的应用程序

1. 打开Launchpad, 点击一下正在下载的程序暂停。
2. Launchpad里面，按住option 这个按键，应用图标左上角就会出现X按钮，点击，会出现问你是否删除，点击删除， 完成

### 4、右上角顶级菜单中图标管理

#### 4.1. 图标顺序管理

按下Command然后用鼠标拖动图标即可调整顺序。   

#### 4.2. 删除无用的图标

搜狗输入法中有一个语音输入，导致在右上角有个 话筒的图标， 可在 搜狗输入法设置里把语音输入取消即可。     

### 5、完全删除garageband音乐创作软件

garageband是Mac下的制作音乐的软件，如果不用可以删除，需要的时候在下载。
删除软件后在磁盘管理还能看见这个软件的一些占用的空间，经过在网上查找资料，可用如下方法彻底删除。      

终端下运行如下命令：     

```
rm -rf /Library/Application\ Support/GarageBand
rm -rf /Library/Application\ Support/Logic
rm -rf /Library/Audio/Apple\ Loops
```

Macintosh HD/Applications/GarageBand.app (1.16GB)       
Macintosh HD/Library/Application Support/GarageBand (995MB)       
Macintosh HD/Library/Application Support/Logic (880MB)        
Macintosh HD/Library/Audio/Apple Loops (up to 10GB)*xx       

### 6、隐藏docker中正在运行的应用图标

终端下进入该应用的目录中，使用`sudo vi`命令打开`Info.plist`

```
// 进入APP目录
cd /Applications/
// 查看目录下安装的软件
ls
// 假设你的软件名字是 YouAppName
cd YouAppName/Contents
// 编辑配置文件
vim Info.plist
// 进入VIM编辑器
```

进入编辑器之后，找到<dict>的部分节点，插入下面红框内的内容 :   

```
<key>LSUIElement</key>
<true/>
```

保存之后，退出相关程序，再次打开，DOCK栏上就没有这个软件的图标了。

![](https://bitbucket.org/repo/oE6yEX/images/3052016934-WX20171128-154651.png)    

参考链接:http://blog.csdn.net/fungleo/article/details/52262315         

### 7、Dashboard

偏好设置 --> Mission Control --> Dashboard      
不是所有 Mac 上的工作都需要使用大型应用程式，有些简单的工作不妨让 [tiger] 上的新功能 Dashboard 来为您完成。只要按下一个键，半透明的 Dashboard 就会浮现在电脑桌面上，供您快速取用多种有趣又实用的迷你应用程式 widget。需要加减乘除吗？交给“计算机”widget 吧！想知道心爱的人所坐的班机飞到哪了吗？请看看 Flight Tracker widget。办公室没有窗户让您一窥外头的情况吗？打开 Weather widget 就知道现在窗外是什么天气。     
http://jingyan.baidu.com/article/066074d6910570c3c21cb0d9.html       

### 8、应用程序安装目录

硬盘名称(如macintoch HD) /Applications 硬盘点开就能看到一个叫应用程序的文件夹，直接安装或拖拽过去就可以了，   
http://jingyan.baidu.com/article/363872ecd5b8406e4aa16f5e.html     

### 9、创建应用程序快捷方式   

1. 在 Finder 中的应用程序中，找到想要创建快捷图标的应用程序     
2. 随后请先按住键盘上的 option+command 键     
3. 接着再把把想要在桌面上创建快捷方式的应用程序拖到桌面了，先松鼠标，当看到有一个快捷箭头以后再把 option+command 键松开。    
4. 当创建了快捷方式成功以后，会看到应用程序图标左下方有一个箭头标志       

### 10、读写mac格式的移动硬盘（去掉写入权限提示）

右键移动硬盘，最下面的 `共享与权限`，点开，把锁打开，然后把当前的用户添加上就可以写入的时候不用输入管理员密码了。

`![](https://bitbucket.org/repo/oE6yEX/images/1853902689-QQ20171220-001025.png)`

### 11、系统桌面背景图片位置    

/Library/Desktop Pictures/    

### 12、去掉屏幕右上角的用户名    

系统偏好设置－－用户与群组－－左侧菜单栏选择登陆选项－－右侧“将快速用户切换菜单显示为...”左边的勾去掉就行了

system preferences -> user and groups -> login options，有一条show fast user switching menu as，有三个选项可以设置。不想要勾掉就好了     

### 13、finder中显示与隐藏文件

使用快捷键：`shift + command + .`

https://jingyan.baidu.com/article/d2b1d1027c6dc65c7e37d435.html     

```
defaults write com.apple.finder AppleShowAllFiles Yes && killall Finder //显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles No && killall Finder //不显示隐藏文件
```

### 14、英文输入时，单词首字母自动大写关闭

System Preferences -> Keyboard -> Text:     Capitalize words automatically(去掉前面的对号即可)

### 15、使用Mail绑定outlook邮箱

1. 打开Mail， 左上角菜单中， mail -> add account(邮件 -> 添加账户)
2. 选择 Exchange > 继续
3. 输入Exchange账户的名称、电子邮件地址和密码 > 登陆
4. 选择想要使用此账户Mac应用程序
5. 单击完成

如果邮件程序不能自动设置您的帐户，请稍等几分钟或几小时，然后重复这些步骤。如果重复步骤之后，邮件仍不能自动设置帐户，请参阅本文中的[我还需了解哪些信息？](https://support.office.com/zh-cn/article/%E5%9C%A8-Mac-OS-X-%E9%82%AE%E4%BB%B6%E4%B8%AD%E8%AE%BE%E7%BD%AE%E7%94%B5%E5%AD%90%E9%82%AE%E4%BB%B6-de372dc4-9648-4044-a76c-e8a60e178d54#__toc325987771)。

[mac 支持](https://support.office.com/zh-cn/article/%E5%9C%A8-Mac-OS-X-%E9%82%AE%E4%BB%B6%E4%B8%AD%E8%AE%BE%E7%BD%AE%E7%94%B5%E5%AD%90%E9%82%AE%E4%BB%B6-de372dc4-9648-4044-a76c-e8a60e178d54)

---------



## 三、 Mac下一些软件配置

### 3.1 ShadowSocks 自定义代理规则

ShadowSocks 默认使用的是 adblock plus 的引擎，要想自己添加规则最好熟悉一下其规则，下面是ShadowSocks 的 pac 规则。

规则大概描述如下

1. 通配符支持，如 `*.example.com/*` 实际书写时可省略 * 如 `.example.com/` 意即 `*.example.com/*`
2. 正则表达式支持，以\开始和结束， 如 `\[\w]+:\/\/example.com\`
3. 例外规则 @@，如 `@@*.example.com/*` 满足@@后规则的地址不使用代理
4. 匹配地址开始和结尾 |，如 `|http://example.com、example.com|` 分别表示以 `http://example.com` 开始和以 `example.com`结束的地址
5. || 标记，如 `||example.com` 则 `http://example.com` 、`https://example.com` 、`ftp://example.com` 等地址均满足条件，只用于匹配地址开头
6. 注释 ! 如 ! Comment
7. 分隔符^，表示除了字母、数字或者 _ - . % 之外的任何字符。如 `http://example.com^` ，`http://example.com/` 和 `http://example.com:8000/` 均满足条件，而 `http://example.com.ar/` 不满足条件

- 如何使用自定义规则

  点击ShadowSocks  -> proxy Setting -> Edit User Rules For PAC

- 参考资料

  https://adblockplus.org/zh_CN/filters

  [ShadowSocks 自定义规则](http://honglu.me/2015/06/26/ShadowSocks%E8%87%AA%E5%AE%9A%E4%B9%89%E8%A7%84%E5%88%99/)

  ​


## ssh远程连接mac   

mac 默认安装了openssh。    
依次代开系统设置－－共享，把remote login勾上，选择允许的用户，就ok了   
在共享里面可以看见ssh命令，看这个命令就可以了。    

* **终端无法使用小键盘**    

终端：偏好设置-->描述文件-->高级-->（去掉勾选）允许VT100应用程序小键盘模式    

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




## Mac 了解应用安装后占用的磁盘空间   

https://segmentfault.com/a/1190000005035742     

### App最喜欢的几个目录    

Mac和Windows操作系统有一个很大的不同，大部分App是没有安装程序的，一般下载下来就是一个dmg文件，     
解开之后直接将App拖到应用程序目录下就可以了，所以给人感觉卸载也就是将App拖到废纸篓然后清空。     
如果真这样做就大错特错，即使一个最简单的App都会在下面几个目录中或多或少留下纪念，这些目录一般有：   

```
~/Library
~/Library/Application Support
~/Library/Application Support/CrashReporter
~/Library/Caches
~/Library/Containers
~/Library/LaunchAgents
~/Library/Preferences
~/Library/PreferencePanes
```

如果一个程序是通过pkg方式安装，或者是在第一次运行时请求管理员权限，那一般还会在如下几个目录中留点纪念：    

```
/Library
/Library/Application Support
/Library/Extensions
/Library/LaunchAgents
/Library/LaunchDaemons
/Library/PreferencePanes
/Library/Preferences
```

以上都还是只是列出了部分，不同的App由于需要还会在其他目录中安装一些文件，比如字处理软件一般会在/Library/Fonts下面安装字体，  
有些扩展组件会放在/Library/ScriptingAdditions下面。     

### ~/Library/Application Support    

这个目录可以说是App最重要的文件目录，一些App本身并不大，但是需要的支持组件和内容非常多，     
特别是采用第三方插件和缓存网络内容的软件，例如我用的Dash，本身的大小只有24MB左右，但是由于经常浏览资料，     
所以缓存了很多网络内容，使得它的Support目录达到了1.37GB！可想而知，如果只是将App扔到废纸篓，几乎不会节省任何空间。    

### ~/Library/Preferences     

这个目录下保存的是App设置，一般来说，稍微有点规模的软件都有自己的配置信息，放在这里的文件虽然占空间不多，      
但是清理掉还是有好处的，例如有些App不能正常工作，即使卸载重装也不行，往往就是配置文件出错了，     
把这里清理掉之后再重装就会有比较好的效果。     


### ~/Library/Containers     

这个目录对于App Store上下载的软件来说，是最重要的一个目录，由于Apple的限制，AppStore的软件都在沙箱中运行，     
每个软件在沙箱都有自己的一个完整空间，对于App来说，它以为自己在一个正常的目录系统中运行，但实际上不是，      
操作系统重定位了读写位置到沙箱之中。      
要是卸载软件的时候，只是简单的在Launchpad中点一下叉来删除，那不知道又有多少空间莫名其妙地消失了，     
我曾经用这种方式卸载了网易云音乐，结果后来才发现，整整417MB的空间不见了……      

### ~/Library/LaunchAgents    

Mac上的随机启动方式之一，熟悉OS X操作系统的同学应该立刻想到了launchctl，这里就是存放启动配置文件的地方，     
大部分App只会往这里写启动信息，请神容易送神难，要送神，只有用第三方工具或是自己手动清理了，     
还有，LaunchAgents 和 LaunchDaemons 是有一些区别的，两者虽然都是随机启动，     





## 腾讯视频.app应用下载的视频存放位置

/Users/*****(用户名文件）/Library/Containers/com.tencent.tenvideo/Data/Library/Application Support/Download/video        

里面视频是被分开截的，所以要用腾讯的播放器才能看，其他mac下播放器离线缓存视频同理只能用对应的播放器看。      
其他播放器（优酷、iqiyi等）路径也在Containers对应的播放器文件目录的/Data/Library/Application Support/Download/video里（也是被截成的片段）

删除视频的时候注意看看这里是否也被删除了。



------------------

-----------------