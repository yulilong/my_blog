###  [**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)     

---------------------------------------------------------------------------------------------------

* [**Git合并多个Commit(本地的)_git修改未push的最后一次commit**](https://bitbucket.org/yulilong/my_wiki/wiki/Git%E5%90%88%E5%B9%B6%E5%A4%9A%E4%B8%AACommit(%E6%9C%AC%E5%9C%B0%E7%9A%84)_git%E4%BF%AE%E6%94%B9%E6%9C%AApush%E7%9A%84%E6%9C%80%E5%90%8E%E4%B8%80%E6%AC%A1commit%E6%B3%A8%E9%87%8A)         


-------------

* add文件后放弃某个文件的添加    
```
git reset file_name
```  
----------------
# git tag — 标签相关操作   

http://blog.csdn.net/wangjia55/article/details/8793577  
http://gitref.org/zh/branching/#tag       

```
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
# 拉取特定分支的代码 #

```
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
-----------
* 分支管理  
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
* git 回滚到某个commit     
```
# 记住最新的commit，然后在用此命令回滚到最新
$ git reset --hard resetVersionHash //将当前branch的HEAD指针指向commit hash

```   
-------  
* git 查看改动  
```
# 当修改文件但是没有提交时：
$ git diff # 查看所有的改动
$ git diff 文件名  #查看这个文件的改动

# 查看某个commit做了哪些改动
$ git show 046bd7b5c1d134b8123f
```    
-----------
* **git恢复删除的文件**  
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

* **查看某个文件的详细修改记录：**    
```
$ git log -p files
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

* **提交历史、各个分支的指向以及项目的分支分叉情况**    

` git log --oneline --decorate --graph --all`     

* **查看各个分支当前所指的对象**     
 
`git log --oneline --decorate`         

#### **git 获取远程分支信息，查看远程所有分支名字**    

`![WX20170420-160920.png](https://bitbucket.org/repo/oE6yEX/images/986142660-WX20170420-160920.png)`     

1. 获取远程分支信息： `git fetch`     
2. 查看远程所有分支名字： `git branch -a`     


####  **git拉取远程新分支到本地**     

本地就一个master分之，远程有2个分之(maseter,develop)，把远程的develop拉取到本地：       

`![WX20170420-162329.png](https://bitbucket.org/repo/oE6yEX/images/112289165-WX20170420-162329.png)`      

```
# 本地的分支是干净的，就是没有修改的文件
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