这个合并只能是本地git仓库的操作，服务器仓库则不行。    

* 如图所示，有三个commit需要合并：       

![WX20170412-135621.png](https://bitbucket.org/repo/oE6yEX/images/3362892446-WX20170412-135621.png)     

使用命令：     
``` 
# -i 的参数是不需要合并的 commit 的 hash 值，为第四个提交的 commit， 接着我们就进入到 vi 的编辑模式
~git rebase -i 568361540e8cd90d1
```     
![WX20170412-140743.png](https://bitbucket.org/repo/oE6yEX/images/1832541917-WX20170412-140743.png)

可以看到其中分为两个部分，上方未注释的部分是填写要执行的指令，而下方注释的部分则是指令的提示说明。指令部分中由前方的命令名称、commit hash 和 commit message 组成。     
当前我们只要知道 pick 和 squash 这两个命令即可：     
pick 的意思是要会执行这个 commit      
squash 的意思是这个 commit 会被合并到前一个commit      
```
pick：正常选中
reword：选中，并且修改提交信息；
edit：选中，rebase时会暂停，允许你修改这个commit（参考这里）
squash：选中，会将当前commit与上一个commit合并
fixup：与squash相同，但不会保存当前commit的提交信息
exec：执行其他shell命令
```

我们将 1b45fb6 这个 commit 前方的命令改成 squash 或 s，然后输入:wq以保存并退出       
这时我们会看到 commit message 的编辑界面：      
![WX20170412-132924.png](https://bitbucket.org/repo/oE6yEX/images/1443189753-WX20170412-132924.png)     

其中, 非注释部分就是两次的 commit message, 你要做的就是将这两个修改成新的 commit message。      
输入wq保存并推出, 再次输入git log查看 commit 历史信息，你会发现这两个 commit 已经合并了。      

![WX20170412-143544.png](https://bitbucket.org/repo/oE6yEX/images/1624539404-WX20170412-143544.png)    

**注意事项：**如果这个过程中有操作错误，可以使用 git rebase --abort来撤销修改，回到没有开始操作合并之前的状态。     

* **注意推送代码之前的命令：**     
```
#  --rebase   还不知道什么意思
~git pull --rebase
```

参考链接：    

http://www.jianshu.com/p/964de879904a     
http://yongpoliu.com/reorganize-git-local-commits/      

-----------

## git修改未push的最后一次commit注释     

其commit提供了一个--amend参数，可以修改最后一次提交的信息.但是如果你已经push过了，那么其历史最后一次，永远也不能修改了。   


```
# 如果设置了 commit简写为 ci，则可以用： git ci --amend
git commit --amend
```        
![WX20170412-145019.png](https://bitbucket.org/repo/oE6yEX/images/12829341-WX20170412-145019.png)     

参考链接：     
http://blog.csdn.net/taget/article/details/7045046