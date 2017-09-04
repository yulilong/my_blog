[**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)     

---------------------------------------------------------------------------------------------------

* [**Git合并多个Commit(本地的)_git修改未push的最后一次commit**](https://bitbucket.org/yulilong/my_wiki/wiki/Git合并多个Commit(本地的)_git修改未push的最后一次commit注释)         


-------------           

[TOC]

## git 一些查看命令    

```
~ git help status              # 查看status命令的帮助

# 查看状态和修改
# https://git-scm.com/book/zh/v2/Git-基础-记录每次更新到仓库, git st -s 详细介绍
~ git status -s                # 状态简览,或 git status --short,得到一种更为紧凑的格式输出.
# git diff 将通过文件补丁的格式显示具体哪些行发生了改变。
~ git diff filename            # 查看未暂存的修改,git diff 只显示尚未暂存的改动,已经add 的文件修改看不见，需要下面的命令
~ git diff --staged filename   # 或git diff --cached, 查看已暂存的将要添加到下次提交里的内容

# commit 提交
~ git commit                   # 这种方式会启动文本编辑器以便输入本次提交的说明
~ git commit -m "提交信息"      # 将提交信息与命令放在同一行,直接提交，
~ git commit -a -m '提交信息'   # `-a`选项，Git 就会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过`git add`步骤。

# 查看提交历史 https://git-scm.com/book/zh/v2/Git-基础-查看提交历史
~ git reflog                  # 查看commit 引用日志记录信息
~ git log -p -2               # -p:用来显示每次提交的内容差异, -2:仅显示最近两次提交.
~ git log --stat              # 每次提交的简略的统计信息,列出额所有被修改过的文件、有多少文件被修改了以及被修改过的文件的哪些行被移除或是添加了。
~ git log --pretty=oneline    # 每个提交放在一行显示,还有 short，full 和 fuller 可以用

~ git log -p files                              # 查看某个文件的详细修改记录
~ git log --oneline --decorate --graph --all    # 提交历史、各个分支的指向以及项目的分支分叉情况
~ git log --oneline --decorate                 # 查看各个分支当前所指的对象

```

-------------
## 获取Git仓库   

```
# https://git-scm.com/book/zh/v2/Git-基础-获取-Git-仓库
# 进入该项目目录
~ git init 
~ git remote add origin http://192.168.102.9/username/ttt.git # 添加远程仓库地址
# 仅仅是做了一个初始化的操作，你的项目里的文件还没有被跟踪,通过 git add 命令来实现对指定文件的跟踪，然后执行 git commit 提交.
~ git clone https://github.com/libgit2/libgit2            # 克隆现有的仓库
~ git clone https://github.com/libgit2/libgit2 mylibgit   # 克隆现有的仓库,自定义本地仓库的名字
# Git 支持多种数据传输协议,https:// 协议,git:// 协议或者使用 SSH 传输协议

# https://git-scm.com/book/zh/v2/Git-基础-远程仓库的使用
~ git remote show origin          # 查看某一个远程仓库的更多信息
~ git remote rename pb paul       # 将 pb 重命名为 paul
~ git remote rm paul              # 移除一个远程仓库
```


----------------
## git tag — 标签相关操作   

http://blog.csdn.net/wangjia55/article/details/8793577  
http://gitref.org/zh/branching/#tag       

```
# https://git-scm.com/book/zh/v2/Git-基础-打标签
# 列出标签 
$ Git tag # 在控制台打印出当前仓库的所有标签
$ git tag -l ‘v0.1.*’ # 搜索符合模式的标签

# 打标签 
$ git tag v0.1.2-light   # 创建轻量标签
# 建议使用附注标签
$ git tag -a v0.1.2 -m “0.1.2版本”     # 创建附注标签
 
# 切换到标签         
$ git checkout [tagname] # 切换到标签
# 如果你想在这个标签中开发，那么则创建一个新分支
$ git checkout -b new_branch_name
$ git show v0.1.2   # 查看标签的版本信息    

# 删除标签     
# 删除本地标签
$ git tag -d v0.1.2 # 删除标签  参数d即delete的缩写，意为删除其后指定的标签。
# 删除远程标签
$ git push origin :refs/tags/<tagname> # 推送一个空tag到远程tag
$ git push origin --delete tag <tagname> # 在Git v1.7.0 之后，可以使用这种语法删除远程分支

# 给指定的commit打标签   
$ git tag -a v0.1.1 9fbc3d0  # 需要你知道某个提交对象的校验和（通过git log获取）

# 标签发布       
# 通常的git push不会将标签对象提交到git服务器，我们需要进行显式的操作：        
$ git push origin v0.1.2 # 将v0.1.2标签提交到git服务器
$ git push origin --tags # 将本地所有标签一次性提交到git服务器
```      
注意：如果想看之前某个标签状态下的文件，可以这样操作：     
1.git tag   查看当前分支下的标签     
2.git  checkout v0.21   此时会指向打v0.21标签时的代码状态，（但现在处于一个空的分支上）      
3. cat  test.txt   查看某个文件        
--------------
## 拉取特定分支的代码

###  1、本地什么也没有：      

```
# 本地什么也没有
$ git clone -b 分支名  代码地址
$ git clone -b euwe-1-rc2 https://github.com/ManageIQ/manageiq  #拉取远程特定分支的代码
# 下载默认分支后还想拉取其他分支的代码
git branch -r          #获取其它分支信息
git branch -a          #查看本地和远程的分支
git remote show origin #查看远程所有分支
git remote update
git fetch
git checkout -b local-name origin/remote-name  #拉取远程分支到本地
```    

### 2、本地就一个master分支，远程有2个分支(master,develop)，把远程的develop拉取到本地：       


`![WX20170420-160920.png](https://bitbucket.org/repo/oE6yEX/images/986142660-WX20170420-160920.png)`     

`![WX20170420-162329.png](https://bitbucket.org/repo/oE6yEX/images/112289165-WX20170420-162329.png)`      

```
# 本地的分支是干净的，也就是没有修改的文件
# 获取远程所有分支名字
~ git fetch
# 显示远程所有分支名字
~ git branch -a
# 提取远程新分支到本地
~ git checkout -b develop origin/develop        

# 拉取远程分支的方法：
# 亲测上面图
# git checkout -b 本地分支名x origin/远程分支名x  #在本地新建分支x，并自动切换到该本地分支x
# 未测试过
# git fetch origin 远程分支名x:本地分支名x     # 在本地新建分支x，但是不会自动切换到该本地分支x，需要手动checkout 
# 另一种方法：https://segmentfault.com/q/1010000002424900

```   
-----------    

## **代码存储，代码修改记录:`git stash`, `git diff > tmp.patch`**

当你在项目的一部分上已经工作一段时间后，所有东西都进入了混乱的状态，而这时你想要切换到另一个分支做一点别的事情。      
或者是要拉取新代码，
```    
# 方法一：
# 把修改的代码备份一下
~ git diff > tmp.patch  
# 放弃所有修改的代码
~ git co .
# 拉取代码
~ git pull
# 把备份的代码还原回去
~ git apply tmp.patch
# 注意，不要有冲突，如果拉取的代码与修改的代码重复就会冲突，小心慎重  

# 方法二： 
# https://git-scm.com/book/zh/v2/Git-工具-储藏与清理
~ git stash                     # 或使用命令：git stash save 暂存当前状态
# 运行上面的命令后，工作目录就变干净了，使用git status 命令查看
~ git stash list                # 显示已暂存列表
stash@{0}: WIP on master: 049d078 added the index file
stash@{1}: WIP on master: c264051 Revert "added file_size"

~ git stash apply               # 将最近的储藏工作重新应用
~ git stash apply stash@{1}     # 应用其中一个更旧的储藏
~ git stash pop                 # 应用储藏然后立即从栈上扔掉它
~ git stash drop stash@{0}      # 移除这个存储

# 当你做了几个改动并只想提交其中的一部分，过一会儿再回来处理剩余改动时，这个功能会很有用。
~ git stash --keep-index        # 不要储藏任何你通过 git add 命令已暂存的东西

~ git stash -u                  # 指定 --include-untracked 或 -u 标记，Git 也会储藏任何创建的未跟踪文件。
```    

-----------
## 分支管理  
```
$ git branch testing # 创建本地分支 
$ git checkout testing  # 切换分支
$ git checkout -b euwe-1-jas # 创建分支并切换到这个分支
$ git branch -d testing  # 删除本地分支分支
# 删除远程分支
# 如果删除失败看看是不是这个分支时默认分支，修改默认分支就好
$ git push origin --delete <branchName> # 在Git v1.7.0 之后，可以使用这种语法删除远程分支
$ git push origin :<branchName>  # 推送一个空分支到远程分支，其实就相当于删除远程分支
#重命令本地分支，
$ git br -m 旧名字 新名字  
# 如果想重命名远程分支，那么先重命名本地分支，然后上传，最后删除就分知名

```     

-----------
## git 回滚到某个commit     

http://www.shouce.ren/api/view/a/13832
```
# 回滚到老的commit
# 方法一
# 记住最新的commit，然后在用此命令回滚
$ git reset --hard resetVersionHash //将当前branch的HEAD指针指向commit hash    
$ git reset --hard 3628164  //老的commit
# 只看commit SHA1 不看作者跟时间
~ git log --pretty=oneline   

# 方法二：
# Git必须知道当前版本是哪个版本，在Git中，用HEAD表示当前版本，也就是最新的提交3628164...882e1e0（注意我的提交ID和你的肯定不一样），上一个版本就是HEAD^，上上一个版本就是HEAD^^，当然往上100个版本写100个^比较容易数不过来，所以写成HEAD~100   
$ git reset --hard HEAD^
HEAD is now at ea34578 add distributed 

# 回到新
# 如果记得新commit的号码
$ git reset --hard 3628164 # 3628164 是新的commit
HEAD is now at 3628164 append GPL 
# 如果不记得commit号，那么可使用如下命令查看：
$ git reflog
ea34578 HEAD@{0}: reset: moving to HEAD^
3628164 HEAD@{1}: commit: append GPL
ea34578 HEAD@{2}: commit: add distributed
```        

-------    
## git 查看改动  
```
# 当修改文件但是没有提交时：
$ git diff # 查看所有的改动
$ git diff 文件名  #查看这个文件的改动

# 查看某个commit做了哪些改动
$ git show 046bd7b5c1d134b8123f
```        

-----------
## **git恢复删除的文件**  
```
# 要查看删除的文件： 
$ git ls-files --deleted
# 使用命令checkout来恢复：
$ git checkout -- file_name
# 如果要恢复多个被删除的文件，可以使用批处理命令：
$ git ls-files -d | xargs git checkout --
# 如果要恢复被修改的文件，命令：
$ git ls-files -m | xargs git checkout --

1.git pull会使用git merge导致冲突，需要将冲突的文件resolve掉 git add -u, git commit之后才能成功pull.

2.如果想放弃本地的文件修改，可以使用git reset --hard FETCH_HEAD，FETCH_HEAD表示上一次成功git pull之后形成的commit点。然后git pull.
```    

 
--------
* **git放弃修改**   
在git命令还没有 commit的时候，可以使用命令放弃文件的修改：   
```
# 放弃所有修改
~ git checkout .
# 放弃修改某个文件
~ git checkout filename
```     
----------
* **"git rm" 和 "rm" 的区别**    

http://blog.csdn.net/jfkidear/article/details/12152167
这是一个比较肤浅的问题，但对于 Git 初学者来说，还是有必要提一下的。     
用 `git rm`来删除文件，同时还会将这个删除操作记录下来；     
用`rm`来删除文件，仅仅是删除了物理文件，没有将其从 git 的记录中剔除。     

直观的来讲，`git rm`删除过的文件，执行`git commit -m "abc"`提交时，     
会自动将删除该文件的操作提交上去。     

而对于用`rm`命令直接删除的文件，执行`git commit -m "abc"`提交时，     
则不会将删除该文件的操作提交上去。     
不过不要紧，即使你已经通过`rm`将某个文件删除掉了，     
也可以再通过`git rm`命令重新将该文件从`git`的记录中删除掉，     
这样的话，在执行`git commit -m "abc"`以后，也能将这个删除操作提交上去。     

如果之前不小心用`rm`命令删除了一大批文件呢？     
是的，此时用`git rm`逐个地再删除一次就显得相当蛋疼了。     
所幸还有更方便的处理方案，用如下的方式做提交就没有问题了：`git commit -am "abc"`      

总结一下：     

在被 git 管理的目录中删除文件时，可以选择如下两种方式来记录删除动作：        
一、`rm + git commit -am "abc" `     
二、`git rm + git commit -m "abc"`      
另外，`git add .` 仅能记录添加、改动的动作，删除的动作需靠`git rm`来完成。      
最后，`rm`删除的文件是处于`not staged`状态的，      
也就是一种介于 “未改动” 和 “已提交过” 之间的状态。     

------




--------

## git 分支合并    

**https://git-scm.com/book/zh/v2/Git-分支-分支的新建与合并**      

现在有2个分支(master, ningning), `master`分支的代码要合并到`ningning`,2个分支代码都已经`git commit`过了，如果没有commit，需要先commit，否则不能合并代码。   

### 合并命令：   

```
$ git checkout ningning
$ git merge master   
```

###  代码没有冲突合并：    

```
# 没有冲突的信息类似于下面：
Updating f42c576..3a0874c
Fast-forward
 index.html | 2 ++
 1 file changed, 2 insertions(+)

# 或者类似于这种结果： 
Merge made by the 'recursive' strategy.
index.html |    1 +
1 file changed, 1 insertion(+)
```   
Git 将合并的结果做了一个新的快照并且自动创建一个新的提交指向它。 

### 代码有冲突合并：   

`![WX20170420-172823.png](https://bitbucket.org/repo/oE6yEX/images/3353411608-WX20170420-172823.png)`     

错误信息类似于：   
```
Auto-merging index.html
CONFLICT (content): Merge conflict in index.html
Automatic merge failed; fix conflicts and then commit the result.
```     
`Auto-merging`是指已经自动合并的文件，       
`CONFLICT (content)`是指有冲突的文件，需要解决冲突的文件。    
打开有冲突的文件，类似于：   
```
<<<<<<< HEAD:ningning
<div id="footer">contact : email.support@github.com</div>
=======
<div id="footer">
 please contact us at support@github.com
</div>
>>>>>>> master   
```   
 `<<<<<`  `=======` 中的是 `ningning`分支的代码，     
`=======`  `>>>>>>` 中的是 `master`分支的代码。    
经过对比后删除冲突部分的代码，        
保存后，使用`git add` 添加修改的文件。     
使用`git commit`命令来完成合并提交：   

`![WX20170421-144406.png](https://bitbucket.org/repo/oE6yEX/images/913542449-WX20170421-144406.png)`    

1.进入commit编辑页面后，输入法切换到英文，按键盘上的`I`键进入编辑commit信息。      
2.编辑好信息后，输入法切换到英文， 然后按`esc`键， 再按`shift + : `, 最后按`wq`保存编辑的文件退出。        
3.上传合并的代码即可,使用`git log`命令即可查看合并的信息：         

`![WX20170421-173612.png](https://bitbucket.org/repo/oE6yEX/images/1127660136-WX20170421-173612.png)`      

### 如果冲突过多，可取消合并     

```
# 取消自己的文件修改或取消其他的文件修改
# https://www.zhihu.com/question/21215715
# ~ git checkout --ours file  撤销自己的修改
# ~ git checkout --theirs file 撤销他们的修改
# 参考链接： https://q.cnblogs.com/q/79372/
~ git reset --hard HEAD 
# 放弃工作区和index的改动,HEAD指针仍然指向当前的commit.
# 这条命令同时还可以用来撤销还没commit的merge,其实原理就是放弃index和工作区的改动，因为没commit的改动只存在于index和工作区中。
~ git reset --hard HEAD^ 
# 用来撤销已经commit的内容(等价于 git reset --hard HEAD~1) 。原理就是放弃工作区和index的改动，同时HEAD指针指向前一个commit对象。
~ git reset --hard ORIG_HEAD # 用来撤销已经commit 的merge. 

```

-------------------------

## **关闭git pull产生的merge 信息**     

linux, 编辑 ~/.gitconfig:    
```
[core]
    mergeoptions = --no-edit
```     
或者终端执行：`git config --global core.mergeoptions --no-edit`       

### git pull 产生merge信息的原因    

Git 作为分布式版本控制系统，所有修改操作都是基于本地的，在团队协作过程中，假设你和你的同伴在本地中分别有各自的新提交，而你的同伴先于你 push 了代码到远程分支上，所以你必须先执行 git pull 来获取同伴的提交，然后才能 push 自己的提交到远程分支。而按照 Git 的默认策略，如果远程分支和本地分支之间的提交线图有分叉的话（即不是 fast-forwarded），Git 会执行一次 merge 操作，因此产生一次没意义的提交记录，从而造成了像上图那样的混乱。       

### **解决**    

参考：[**洁癖者用 Git：pull --rebase 和 merge --no-ff**](http://hungyuhei.github.io/2012/08/07/better-git-commit-graph-using-pull---rebase-and-merge---no-ff.html)       
其实在 pull 操作的时候，，使用 git pull --rebase 选项即可很好地解决上述问题。 加上 --rebase 参数的作用是，提交线图有分叉的话，Git 会 rebase 策略来代替默认的 merge 策略。 使用 rebase 策略有什么好处呢？     
假设提交线图在执行 pull 前是这样的：    
```
        A---B---C  remotes/origin/master
                /
           D---E---F---G  master
```     
如果是执行`git pull` 后，提交线图会变成这样：     
```
A---B---C remotes/origin/master
                /         \
           D---E---F---G---H master
```
结果多出了 H 这个没必要的提交记录。如果是执行 `git pull --rebase`的话，提交线图就会变成这样：       
```
remotes/origin/master
                           |
           D---E---A---B---C---F'---G'  master
```    
F G 两个提交通过 rebase 方式重新拼接在 C 之后，多余的分叉去掉了，目的达到。      

会把你的本地`master`分支里的每个提交(commit)取消掉，并且把它们临时 保存为补丁(patch)(这些补丁放到".git/rebase"目录中),然后把本地`master`分支更新 到最新的"origin"分支，最后把保存的这些补丁应用到本地"maser"分支上。

关于`git --rebase`介绍：    
http://gitbook.liuhui998.com/4_2.html          
http://blog.csdn.net/hudashi/article/details/7664631/        


---------------
##  git pull文件时和本地文件冲突    

http://www.01happy.com/git-resolve-conflicts/     

当拉去远程代码时，出现如下错误：    
```
error: Your local changes to 'c/environ.c' would be overwritten by merge.  Aborting.
Please, commit your changes or stash them before you can merge.
```     
这个意思是说更新下来的内容和本地修改的内容有冲突，先提交你的改变或者先将本地修改暂时存储起来。       
处理的方式非常简单，可使用git stash命令或者提交修改。   

-----------------

## git删除远程仓库的一次commit提交    

```
# 参考链接： http://zhuqingcode.github.io/git/2014/05/15/github-a-bug-commit.html
# 方法一： 删除远程一次提交
~ git reset --hard HEAD~1 
~ git push --force             ## 强制推送提交，
~ git push -f origin master    ## 强制推送提交   

# 方法二： 采取revert的方法，相当于重新生成一个提交，来撤销前一次错误的commit。
~ git revert HEAD
~ git push origin master

```
![WX20170606-132452.png](https://bitbucket.org/repo/oE6yEX/images/1783048239-WX20170606-132452.png)