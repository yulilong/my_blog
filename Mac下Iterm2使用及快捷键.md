[TOC]

### 1. 光标控制

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

 

### 2. 窗口面板管理：一个窗口分割

垂直分割: Command + D

- 水平分割: Shift + Command + D
- 前一个面板: Command + [    或  Option + Command + 左右方向键
- 后一个面板: Command + ]
- 切换到上/下/左/右面板: Option + Command + 上下左右方向键
- 关闭panel：⌘ + w
- 最大化Tab中的pane，隐藏本Tab中的其他pane：⌘+ shift +enter , 再次还原

### 3. 新建Tab标签页

- 新建标签页: Command + T
- 关闭标签页: Command + W
- 前一个标签页: Command + 左方向键，Shift + Command + [
- 后一个标签页: Command + 右方向键，Shitf + Command + ]
- 进入标签页1，2，3…: Command + 标签页编号
- Expose 标签页: Option + Command + E（将标签页打撒到全屏，并可以全局搜索所有的标签页）

窗口太多，可以使用 ⌘ + / 快速定位到光标所在位置



### 4. 多个窗口操作

- 新建窗口：command + N
- 关闭窗口： command + w
- 前一个窗口：command + `
- 后一个窗口：Shitf + command + `
- 进入窗口 1,2,3：option + command + 编号

 

### 5. 其他功能

- 支持自定义全局快捷键用于显示和隐藏iTerm2 Preference -> Keys －> Show/hide iTerm2 with a system-wide hotkey 打上勾之后
- 进入和退出全屏: Command + Enter
- 查看当前终端中光标的位置: Command + /
- 命令自动补全: Command + ;（很少用这个，还是感觉Zsh的补全更好用）
- 开启和关闭背景半透明: Command + u
- 清屏（重置当前终端）: Command + r



### 粘贴历史

使用Command + Shift + h 可以呼出粘贴历史，支持模糊检索。还可以设置将粘贴历史保存在磁盘上（Preferences -> General）

 ### 即时回放

使用Command + Opt + b 打开即时回放，按Esc退出。即时回放可以记录终端输出的状态，让你“穿越时间”查看终端内容。默认每个会话最多储存4MB的内容，可以在设置中更改（Preferences -> Genernal -> Instant Replay）。



### iTerm2快捷键设置

### 1. 设置光标按照单词快速移动设置

iTerm2之后，发现option+←和option+→这两组快捷键并不能实现光标按照单词快速移动，

在Mac自带的终端中是可以使用这两个快捷键的，经过查找和测试发现，需要重新配置相应的映射。iTerm2中将这两组快捷键用作了其他的功能。

- 打开iTerm2的Preferences设置
- 选择相应的Profile（默认为Default），选择“Keys”选项卡，然后可以在Key Mappings看到option+←和option+→这两组快捷键用作了其他功能，这里我们只需要重新绑定新的映射即可
- 找到option+← ， 双击就会弹出一个编辑框，选择Action为“Send Escape Sequence”, 然后在 Esc+选项中输入`b`
- 找到option+→， 双击就会弹出一个编辑框，选择Action为“Send Escape Sequence”, 然后在 Esc+选项中输入`f`

修改映射之后，再重新启动iTerm2就可以使用option+←和option+→来实现光标按单词快速移动了，非常方便。如果不想使用option+←和option+→这两个组合键的话，也可以自行添加新的Shortcut即可。



### 参考资料

[iterm2使用快捷键](https://www.jianshu.com/p/da7728a8a4d7)

[关于iTerm2 你不知道的一些事](https://www.jianshu.com/p/3436bcb17a03)

[Mac下iTerm2光标按照单词快速移动设置](https://blog.csdn.net/skyyws/article/details/78480132?locationNum=4&fps=1)



