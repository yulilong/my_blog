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

我们将 1b45fb6 这个 commit 前方的命令改成 squash 或 s，然后输入:wq以保存并退出       
这时我们会看到 commit message 的编辑界面：      
![WX20170412-132924.png](https://bitbucket.org/repo/oE6yEX/images/1443189753-WX20170412-132924.png)