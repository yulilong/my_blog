###  [**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)     
-----------------------------------------------------------------------------------------

* **睡眠重启关机**       
Ctrl+Shift+Power: 关闭屏幕      
Cmd+Opt+Power: 睡眠 (sleep)     
Cmd+Ctrl+Power: 重启 (restart)     
Cmd+Ctrl+Opt+Power: 关机 (shutdown)

* **一个应用多个窗口之间切换快捷键： **  

默认cmd+`就是程序内窗口切换。或者你用手势，四指下滑（有些人用三指的）     

* **多个桌面切换快捷键**    

Control + 箭头 → ←       

* **全屏(变成一整个桌面)，退出全屏再按一次**    
Control-Command-F   

* **最小化应用**    
Command + M

* **同一个应用多个窗口切换**   
Command + ~(就是esc下面那个按键)     

* **关闭窗口**   
Command + W   

* **退出应用**   
Command + Q      

* **强制退出Mac程序**    

使用快捷键：Command+Option+Esc
来打开“强制退出应用程序”的窗口，然后选中你需要退出的程序，再点右下方的“强制退出”即可。     

使用终端命令强制退出程序：
终端中输入命令`killall [程序名称]`.        
比如说强制退出Safari，就输入 killall Safari 再回车即可，这样有关Safari的全部进程就都退出了；如果你想分的细一些，可以通过 ps 或者 ps aux 命令查找某些单独的进行，然后使用 kill -9 [pid] 来单独结束某个进程。      
很多情况下强制退出程序，之前的内容可能就会不在了，需要注意一下。       

使用键盘快捷键强制退出处于活跃状态的Mac程序:      
快捷键：`Command+Option+Shift+Esc` , 这样按住一两秒钟，就可以强制退出当前程序了，算是最方便的一种方法。     

http://www.cnbeta.com/articles/tech/175447.htm     

* **调整OS X系统窗口大小**   
1.Option 键双向加宽，按着Option 键再一起拖曳窗口会变成往两边伸展。    
2.Shift 键放射状加大， shift把窗口长宽一起加大。    
3.在窗口顶部按两下，最大化窗口。    

* **浏览器快捷键**   
cmd+1（2、3...）分别是打开书签栏的第一个、第二个...网址     
切换网页 ：Option + Command + 箭头 → ←       
从新打开关闭的标签： shift + command +T       
刷新网页：         cmd + R         

* **隐藏 ／显示Dock**   
option + command + D       

* **删除文件快捷键**  
Command + Delete(|\上面的按键)：将某个项目直接删除至废纸篓。     
Shift + Command + Delete：清空废纸篓。    
Shift + option + Command + Delete：强制清空废纸篓（无警告）。      

* **终端光标做操快捷键**    

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

* **检测文件参数MD5、sha1、sha256**    

```
# 查看文件MD5：
md5[空格][拖曳要检测的文件到此处]

# 查看文件SHA1:
openssl dgst -sha1[空格][拖曳要检测的文件到此处]

# 查看文件SHA256：
openssl dgst -sha256[空格][拖曳要检测的文件到此处]
```