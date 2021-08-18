[TOC]



# Windows下常见问题

## 1. 修改hosts文件

hosts文件位置：`C:\Windows\System32\drivers\etc\hosts`

随便打开一个文件夹，然后在地址栏中输入上面的路径，然后选择使用txt编辑器打开，编辑后保存即可。

## 2. win10系统卸载edge浏览器

1、找到`windows powershell`,右键以管理员身份运行。进入蓝色命令界面。

2、输入代码 get-appxpackage *edge*，查找edge包。

3、在edge包中找到 packagefullname，选中并复制。

4、接着输入命令 Remove-appxpackage 和 packagefullname包名，用来移除edge包。

5、按下回车后进入win10系统的microsoft edge中将其移除即可。

如果上面操作失败，可以根据提示在`启用或关闭windows 功能`中关闭。打开控制面板，选择程序，在程序和功能中，找到`启用或关闭windows 功能`，找到选线后，取消勾选，然后点确定，重启电脑就可以了。

