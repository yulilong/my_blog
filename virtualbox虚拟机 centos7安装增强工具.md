# 设置终端启动快捷键
http://www.centoscn.com/CentOS/config/2015/0330/5044.html
```
1. 首先打开Applications,选择System Tools
2. 选择Setting进入下面界面
3. 选择Keyboard，进入下面界面，点击Shortcuts
4. 再点击+号，弹出对话框
5. 
Name：        Run a Terminal
Command:  /usr/bin/gnome-terminal (Terminal 程序的路径）
点击apply
6. 一开始是禁用（disabled）的,点击disabled出现下面情形,此时按下你喜欢的快捷键比如Ctrl+Alt+T,
```
在virtualbox虚拟机中，如果鼠标指针出不来， 按键盘上右边的 alt+ctrl。

# 添加virtualbox 增强工具
http://www.tuicool.com/articles/VRbq2em
```
$ sudo yum update
$ sudo yum install gcc kernel-devel kernel-headers dkms make bzip2 
$ reboot
```