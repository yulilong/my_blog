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

## cp  scp
```
http://www.jb51.net/LINUXjishu/70474.html
Linux为我们提供了两个用于文件copy的命令，一个是cp，一个是scp，但是他们略有不同。 
cp --- 主要是用于在同一台电脑上，在不同的目录之间来回copy文件 
scp --- 主要是在不同的Linux系统之间来回copy文件
将档案 aaa 复制(已存在)，并命名为 bbb： 
cp aaa bbb 
从 本地 复制到 远程 
scp /home/daisy/full.tar.gz root@172.19.2.75:/home/root （然后会提示你输入另外那台172.19.2.75主机的root用户的登录密码，接着就开始copy了），复制目录加参数 -r 即可 
从 远程 复制到 本地 
scp root@/172.19.2.75:/home/root/full.tar.gz /home/daisy/full.tar.gz
```

##centos添加用户跟组
```
http://zhidao.baidu.com/link?url=YWnbBbR1fLGrWwQ9bKROr_2A_7fotpIgs2IJA0yh7-MfDDBKf3GSsB8Hab1pn0-Q8xpBnW0rSUUOhY1jIngKlX_O3-O9q2G0uIQCsANK80e
```