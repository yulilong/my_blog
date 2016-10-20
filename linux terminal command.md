## 查看当前用户
whoami
## linux修改文件所属用户和组
```
使用chown命令可以修改文件或目录所属的用户：

       命令：chown 用户 目录或文件名

       例如：chown qq /home/qq  (把home目录下的qq目录的拥有者改为qq用户) 

使用chgrp命令可以修改文件或目录所属的组：

       命令：chgrp 组 目录或文件名

       例如：chgrp qq /home/qq  (把home目录下的qq目录的所属组改为qq组)
如果需要修改目录及子目录的权限则需要加 -R
sudo chown yulilong -R local

```