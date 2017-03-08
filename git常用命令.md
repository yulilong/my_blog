###  [**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)     

---------------------------------------------------------------------------------------------------

* add文件后放弃某个文件的添加    
```
git reset file_name
```  
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
* git 回滚到某个commit     
```
# 
$ git reset 046bd7b5c1d134b8123f
$ git reset --hard resetVersionHash //将当前branch的HEAD指针指向commit hash

```     
* git 查看改动  
```
# 当修改文件但是没有提交时：
$ git diff # 查看所有的改动
$ git diff 文件名  #查看这个文件的改动

# 查看某个commit做了哪些改动
$ git show 046bd7b5c1d134b8123f
```