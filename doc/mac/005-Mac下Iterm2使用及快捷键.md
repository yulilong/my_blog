[TOC]

## 1. 光标控制

ctrl + a: 到行首

ctrl + e: 行末

ctrl + f/b: 前进后退，相当于左右方向键，但是显然比移开手按方向键更快

ctrl + p: 上一条命令，相当于方向键上

ctrl + r: 搜索命令历史，这个大家都应该很熟悉了

ctrl + d: 删除当前字符

ctrl + h: 删除之前的字符

ctrl + w: 删除光标前的单词

ctrl + k: 删除到文本末尾

ctrl + t: 交换光标处文本

⌘ + —/+/0: 调整字体大小

⌘ + r:清屏，其实是滚到新的一屏，并没有清空。ctrl + l 也可以做到。


## 2. 终端操作快捷键
### 2.1 窗口面板管理：一个窗口分割

垂直分割: Command + D

- 水平分割: Shift + Command + D
- 前一个面板: Command + [    或  Option + Command + 左右方向键
- 后一个面板: Command + ]
- 切换到上/下/左/右面板: Option + Command + 上下左右方向键
- 关闭panel：⌘ + w
- 最大化Tab中的pane，隐藏本Tab中的其他pane：⌘+ shift +enter , 再次还原

### 2.2 新建Tab标签页

- 新建标签页: Command + T
- 关闭标签页: Command + W
- 前一个标签页: Command + 左方向键，Shift + Command + [
- 后一个标签页: Command + 右方向键，Shitf + Command + ]
- 进入标签页1，2，3…: Command + 标签页编号
- Expose 标签页: Option + Command + E（将标签页打撒到全屏，并可以全局搜索所有的标签页）

窗口太多，可以使用 ⌘ + / 快速定位到光标所在位置



### 2.3 多个窗口操作

- 新建窗口：command + N
- 关闭窗口： command + w
- 前一个窗口：command + `
- 后一个窗口：Shitf + command + `
- 进入窗口 1,2,3：option + command + 编号

 

### 2.4 其他功能

- 支持自定义全局快捷键用于显示和隐藏iTerm2 Preference -> Keys －> Show/hide iTerm2 with a system-wide hotkey 打上勾之后
- 进入和退出全屏: Command + Enter
- 查看当前终端中光标的位置: Command + /
- 命令自动补全: Command + ;（很少用这个，还是感觉Zsh的补全更好用）
- 开启和关闭背景半透明: Command + u
- 清屏（重置当前终端）: Command + r

#### 2.4.1 粘贴历史

使用Command + Shift + h 可以呼出粘贴历史，支持模糊检索。还可以设置将粘贴历史保存在磁盘上（Preferences -> General）

#### 2.4.2 即时回放 

使用Command + Opt + b 打开即时回放，按Esc退出。即时回放可以记录终端输出的状态，让你“穿越时间”查看终端内容。默认每个会话最多储存4MB的内容，可以在设置中更改（Preferences -> Genernal -> Instant Replay）。

### 2.5 自定义快捷键设置

#### 2.5.1设置光标按照单词快速移动 

iTerm2之后，发现option+←和option+→这两组快捷键并不能实现光标按照单词快速移动，

在Mac自带的终端中是可以使用这两个快捷键的，经过查找和测试发现，需要重新配置相应的映射。iTerm2中将这两组快捷键用作了其他的功能。

- 打开iTerm2的Preferences设置
- 选择相应的Profile（默认为Default），选择“Keys”选项卡，然后可以在Key Mappings看到option+←和option+→这两组快捷键用作了其他功能，这里我们只需要重新绑定新的映射即可
- 找到option+← ， 双击就会弹出一个编辑框，选择Action为“Send Escape Sequence”, 然后在 Esc+选项中输入`b`
- 找到option+→， 双击就会弹出一个编辑框，选择Action为“Send Escape Sequence”, 然后在 Esc+选项中输入`f`

修改映射之后，再重新启动iTerm2就可以使用option+←和option+→来实现光标按单词快速移动了，非常方便。如果不想使用option+←和option+→这两个组合键的话，也可以自行添加新的Shortcut即可。

## 3. 个性化的设置

### 3.1 设置无分栏边框

preference->appearance：

取消：Show per-pane title bar with split panes

勾选：Hide scrollbars

### 3.2 终端显示边框

preference->appearance：

勾选：Show border around window

### 3.2 显示、隐藏终端快捷键

Preferences -> Keys -> Hotkey:

勾选： Show/hide iTerm2 with a system-wide hotkey

然后在下面的Hotkey里面填上F12，

这个F12可能被系统占用了，这修改系统的快捷键，或更换别的快捷键。

### 3.3 鼠标移动切换窗口

当一个终端打开了多个窗口，可以设置鼠标移动窗口时获取焦点

Preferences -> Pointer:

勾选：Focus follows mouse

### 3.4 设置光标形状

Preferences -> Profiles -> Profile Name -> Text -> Cursor

选择一个自己喜欢的样式

### 3.5 新窗口打开的路径跟当前终端的路径一直

Preferences -> Profiles -> General -> Working Directory ->  reuse previous session's directory



### 3.6 新窗口在电脑获取焦点的窗口生成

Preferences -> Profiles -> General -> Window -> Settings for New Windows -> Screen 

选择：No Preference

或者选择：Screen with Cursor（在鼠标的窗口）

### 3.7 设置开机启动不显示界面

1、打开系统设置(System Perferences) -> 通用 -> 登陆项(Login Items)，登录时打开-> 点击加号，然后去应用程序里面找到Iterm2添加到启动项里面。
2、启动iterm2程序，打开一个窗口，然后手动点击关闭按钮，确保电脑右上角苹果图标右边是iTerm2,然后
按【Command】+【Shift】+【S】，保存名为No Window
3、打开一个iterm2终端界面，然后按`cmd + ,`打开iterm的设置界面，选择`Arrangements`，点击刚才保存的`No Window`， 然后点击`Set Default`。
4、在iterm的设置界面选择`General`, 在`Startup`中选择`Open Default Window Arrangement`。

参考资料：https://blog.csdn.net/weixin_34023863/article/details/85958226

## 4. iterm2软件版本更新

由于我本人mac系统升级(10.14升级到13.7.1)，导致iterm2软件出现了一些问题，比如：终端半透明效果没有了，查看终端内容上下滚动的时候部分内容消失了。因此需要升级软件版本来解决这些问题

1、官网下载软件：https://iterm2.com/ 打开页面后，直接点击`Download`按钮下载软件。

2、软件下载下载后，是一个压缩包，解压缩。

3、完全退出iterm2软件，然后双击解压的软件，软件会提示是否移动到应用文件夹。移动成功后会自动打开软件，此时就是最新的软件了。

更新后软件设置都是之前一样的，没有变动。出现的问题都会修复。

## 参考资料

[iterm2使用快捷键](https://www.jianshu.com/p/da7728a8a4d7)

[关于iTerm2 你不知道的一些事](https://www.jianshu.com/p/3436bcb17a03)

[Mac下iTerm2光标按照单词快速移动设置](https://blog.csdn.net/skyyws/article/details/78480132?locationNum=4&fps=1)

[打造有情怀的 iTerm2 终端](https://www.jianshu.com/p/83c38271b09c)



