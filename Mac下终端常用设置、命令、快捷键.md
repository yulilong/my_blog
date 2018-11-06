[TOC]

## 1. 介绍   

macos的很多用户都是做it相关的人，类unix系统带来了很多方面，尤其是经常和Linux打交道的人。 但是作为经常使用linux 命令行的人发现macos中的命令行工具很多都是bsd工具，跟linux下得使用方式开始差距挺大的        

Max OS X使用的是 BSD版本的命令行工具，这些命令跟 Linux版本是有些不同的，然而它们都遵循 POSIX 标准。    

资料：  http://blog.csdn.net/orangleliu/article/details/47357339      

## 2. 终端设置

### 2.1 修改mac终端命令行前缀的显示

/etc/bashrc 中的PS1变量就是用来设置前缀显示的。

1. 终端打开/etc/bashrc文件：

   ```
   sudo vim /etc/bashrc
   ```

2. 修改PS1变量，例如修改为如下形式(把原来的注释掉：

   ```
   # PS1='\h:\W \u\$ '
   PS1='\u\$ '
   ```

3. wq!保存并退出，将终端退出重新打开生效。

4. 变量代表的含义

   > \h表示本地主机名 
   >
   > \W表示符号~ 
   >
   > \u表示用户名 
   >
   > `\$表示符号$` 

### 2.2 修复终端hostname被篡改为bogon

终端显示bogon原因：

1. terminal显示hostname之前会先根据本机IP做一次rDNS反向查询，就是通过ip地址查询hostname，如果没有查询到，那么使用本机设置的hostname。本机IP通常是局域网IP地址（保留IP地址），一般是查不到的，所以terminal一般显示的本机设置的hostname，比如`laowang's-macbook`。

2. 上面提到，局域网IP地址一般是查不到hostname，是因为ISP提供商或者用户防火窗的屏蔽保留IP地址，因为保留IP地址在公网中没啥用，即便是没有被屏蔽掉，rDNS服务器一般也会关闭响应保留IP地址的查询请求。凡事都有例外，rDNS服务器对这种保留IP地址对查询一律返回bogon。在ipv4对地址划分中，除了公网分配在用对IP地址外，其余保留IP地址统一叫做bogon space

解决方法：

1. 将DNS设置为Google的DNS服务器地址  8.8.8.8 

2. 终端输入如下命令：

   ```
   sudo hostname MBP
   sudo scutil --set LocalHostName $(hostname)
   sudo scutil --set HostName $(hostname)
   ```

   注：上面MBP就是你想要修改的新名字。

### 2.3 终端shell与zsh之间的切换

```
# 切换默认Shell为Zsh, 成功后需要重启终端
~ chsh -s /bin/zsh
# 切换Zsh为Shell， 成功后需要重启终端
~ chsh -s /bin/bash  
# 查看zsh配置的环境变量：
~ cat ~/.zshrc
```







## 3. 快捷键

```
control + L			// 终端清屏，相当于 clear命令
open 文件名		// 使用默认程序打开文件 如 open . 使用finder打开该目录
```

### 3.1 终端光标做操快捷键

Mac Terminal终端和Linux上终端光标的快捷键操作是一样的，都是来自Emacs这个神级的编辑器,跟VIM不一样。

```
Ctrl + a        光标移动到行首（Ahead of line），相当于通常的Home键
Ctrl + e        光标移动到行尾（End of line）
Alt+← 或 ESC+B：左移一个单词；
Alt+→ 或 ESC+F：右移一个单词；
Ctrl + d        删除一个字符，相当于通常的Delete键（命令行若无所有字符，则相当于exit；处理多行标准输入时也表示eof）
Ctrl + h        退格删除一个字符，相当于通常的Backspace键
Ctrl + u        删除光标之前到行首的字符
Ctrl + k        删除光标之前到行尾的字符
Ctrl + c        取消当前行输入的命令，相当于Ctrl + Break
Ctrl + f        光标向前(Forward)移动一个字符位置
Ctrl + b        光标往回(Backward)移动一个字符位置
Ctrl + l        清屏，相当于执行clear命令
Ctrl + p        调出命令历史中的前一条（Previous）命令，相当于通常的上箭头
Ctrl + n        调出命令历史中的下一条（Next）命令，相当于通常的上箭头
Ctrl + r        显示：号提示，根据用户输入查找相关历史命令（reverse-i-search）

次常用快捷键：
Alt + f         光标向前（Forward）移动到下一个单词
Alt + b         光标往回（Backward）移动到前一个单词
Ctrl + w        删除从光标位置前到当前所处单词（Word）的开头
Alt + d         删除从光标位置到当前所处单词的末尾
Ctrl + y        粘贴最后一次被删除的单词
```



### 3.2  处理窗口和标签页快捷键

| 操作                           | 快捷键                     |
| ------------------------------ | -------------------------- |
| 新建窗口                       | Command-N                  |
| 使用相同命令新建窗口           | Control-Command-N          |
| 新建标签页                     | Command-T                  |
| 使用相同命令新建标签页         | Control-Command-T          |
| 显示或隐藏标签页栏             | Shift-Command-T            |
| 显示所有标签页或退出标签页概览 | Shift-Command-反斜杠 (\)   |
| 新建命令                       | Shift-Command-N            |
| 新建远程连接                   | Shift-Command-K            |
| 显示或隐藏检查器               | Command-I                  |
| 编辑标题                       | Shift-Command-I            |
| 编辑背景颜色                   | Option-Command-I           |
| 放大字体                       | Command-加号键 (+)         |
| 缩小字体                       | Command-减号键 (–)         |
| 下一个窗口                     | Command-重音符键 (`)       |
| 上一个窗口                     | Command-Shift-波浪符号 (~) |
| 下一个标签页                   | Control-Tab                |
| 上一个标签页                   | Control-Shift-Tab          |
| 将窗口拆分为两个面板           | Command-D                  |
| 关闭拆分面板                   | Shift-Command-D            |
| 关闭标签页                     | Command-W                  |
| 关闭窗口                       | Shift-Command-W            |
| 关闭其他标签页                 | Option-Command-W           |
| 全部关闭                       | Option-Shift-Command-W     |
| 滚动到顶部                     | Command-Home               |
| 滚动到底部                     | Command-End                |
| 上一页                         | Command-Page Up            |
| 下一页                         | Command-Page Down          |
| 上一行                         | Option-Command-Page Up     |
| 下一行                         | Option-Command-Page Down   |



## 4. 终端常用操作

### 4.1 查看进程    

```
# 搜索特定进程，
~ ps aux|grep 进程名字
# 动态显示进程
~ top
```

### 4.2 查看端口号   

```
# 搜索端口号为8080, 可以看见进程名字与ID
lsof -i:8080   
# 查看IPv4端口：(最好加 sudo)
~ lsof -Pnl +M -i4   

# 查看IPv6协议下的端口
lsof -Pnl +M -i6

~ sudo netstat antup
```

参考链接：     

http://blog.csdn.net/u011619283/article/details/53116291     
http://blog.csdn.net/winkenjiang/article/details/7588658         

------------------

### 4.3  终端使用代理     

#### 4.3.1 终端临时使用代理，只对这个终端有效，关闭后失效：

```
export http_proxy=http://proxyAddress:port  

export http_proxy="http://127.0.0.1:1080"
export https_proxy="http://127.0.0.1:1080"
```

这个办法的好处是简单直接，并且影响面很小（只对当前终端有效）。      

#### 4.3.2 终端永久使用代理： 把代理服务器地址写入shell配置文件.bashrc或者.zshrc     

直接在.bashrc或者.zshrc添加下面内容:    

```
# vi ~/.ashrc    

export http_proxy="http://localhost:port"
export https_proxy="http://localhost:port"   

# 以使用shadowsocks代理为例，ss的代理端口为1080,那么应该设置为：   
export http_proxy="http://127.0.0.1:1080"
export https_proxy="http://127.0.0.1:1080"
```

localhost就是一个域名，域名默认指向 127.0.0.1，两者是一样的。     
然后ESC后:wq保存文件，接着在终端中执行source ~/.bashrc        
或者退出当前终端再起一个终端。 这个办法的好处是把代理服务器永久保存了，下次就可以直接用了。    

### 4.4 终端进入名称带空格的目录   

可使用`\ ` `' '` `" "` 将空格转义就可以了。

```
1. cd Appications/Android\ Studio.app/sdk 
2. cd Appications/Android' 'Studio.app/sdk
3. cd Appications/Android" "Studio.app/sdk
```




## 参考资料

[“终端”键盘快捷键](https://support.apple.com/zh-cn/guide/terminal/trmlshtcts/mac)

