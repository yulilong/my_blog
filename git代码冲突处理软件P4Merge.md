### **下载安装**    

下载地址：https://www.perforce.com/downloads/helix-visual-client-p4v      
下载教程：http://blog.csdn.net/wirelessqa/article/details/9035215      
这里下载之前需要注册。   
`![WX20170601-134653.png](https://bitbucket.org/repo/oE6yEX/images/1135708659-WX20170601-134653.png)`     

 ###  **配置脚本**     

编写一个全局包装脚本来运行你的命令。 我们会使用 Mac 上的路径来指定该脚本的位置，在其他系统上，它将是 p4merge 二进制文件所在的目录。 创建一个名为 extMerge 的脚本包装 merge 命令，让它把参数转发给 p4merge 二进制文件：         
```
$ cat /usr/local/bin/extMerge
#!/bin/sh
/Applications/p4merge.app/Contents/MacOS/p4merge $*
```
创建一个extDiff的脚本：      
```
$ cat /usr/local/bin/extDiff
#!/bin/sh
[ $# -eq 7 ] && /usr/local/bin/extMerge "$2" "$5"
```
确保这些脚本具有可执行权限：      
```
$ sudo chmod +x /usr/local/bin/extMerge
$ sudo chmod +x /usr/local/bin/extDiff
```
配置git命令支持这个软件：     
```
$ git config --global merge.tool extMerge
$ git config --global mergetool.extMerge.cmd \
  'extMerge \"$BASE\" \"$LOCAL\" \"$REMOTE\" \"$MERGED\"'
$ git config --global mergetool.extMerge.trustExitCode false
$ git config --global diff.external extDiff
```    
待一切设置妥当后，如果你像这样运行 diff 命令`git diff 32d1776b1^ 32d1776b1` Git 将启动 P4Merge，而不是在命令行输出比较的结果.      
如果你尝试合并两个分支，随后遇到了合并冲突，运行 **`git mergetool`**，Git 会调用 P4Merge 让你通过图形界面来解决冲突。