## rails fileutils.rb:250:in `mkdir': Permission denied @ dir_s_mkdir
http://stackoverflow.com/questions/33754137/rails-server-command-returns-error-mkdir-permission-denied-dir-s-mkdir
这个问题就是rails要创建的文件没有权限，如果你了解这个文件路径，那么可以手动修改这个路径的权限,则问题就解决了。
```
sudo mkdir tmp
sudo chmod 777 tmp
```

## 由于之前安装了miq-Citrix,导致manageiq登陆不上提示token无效

删除系统中/var 中的 www 文件夹就好了