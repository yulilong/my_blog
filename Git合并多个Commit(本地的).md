这个合并只能是本地git仓库的操作，服务器仓库则不行。    

* 如图所示，有三个commit需要合并：       

![WX20170412-135621.png](https://bitbucket.org/repo/oE6yEX/images/3362892446-WX20170412-135621.png)     

使用命令：     
``` 
# -i 的参数是不需要合并的 commit 的 hash 值，为第四个提交的 commit， 接着我们就进入到 vi 的编辑模式
~git rebase -i 568361540e8cd90d1
```