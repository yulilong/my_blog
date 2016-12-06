## add文件后放弃某个文件的添加 ##

```
#!git

git reset file_name
```  

# git tag — 标签相关操作 #  

http://blog.csdn.net/wangjia55/article/details/8793577  
http://gitref.org/zh/branching/#tag       

* 列出标签     


```
#!git

$ Git tag # 在控制台打印出当前仓库的所有标签
$ git tag -l ‘v0.1.*’ # 搜索符合模式的标签
```  

* 打标签   


```
#!git

# 创建轻量标签
$ git tag v0.1.2-light
# 创建附注标签
$ git tag -a v0.1.2 -m “0.1.2版本”
```



