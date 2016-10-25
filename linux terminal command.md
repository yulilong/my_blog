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
cp [options] source1 source2 source3 …. directory
上面第一条命令为单个文件或目录拷贝，下一个为多个文件拷贝到最后的目录。
options选项包括：
- a 保留链接和文件属性，递归拷贝目录，相当于下面的d、p、r三个选项组合。
- d 拷贝时保留链接。
- f 删除已经存在目标文件而不提示。
- i 覆盖目标文件前将给出确认提示，属交互式拷贝。
- p 复制源文件内容后，还将把其修改时间和访问权限也复制到新文件中。
- r 若源文件是一目录文件，此时cp将递归复制该目录下所有的子目录和文件。当然，目标文件必须为一个目录名。
- l 不作拷贝，只是链接文件。
-s 复制成符号连结文件 (symbolic link)，亦即『快捷方式』档案；
-u 若 destination 比 source 旧才更新 destination。
cp命令使用范例：
1、将文档 file1复制成file2，复制后名称被改file2
cp -i file1 file2
或，
cp file1 file2
2、将文档 file1复制到dir1目录下，复制后名称仍未file1
cp -i file1 dir1
或，
cp file1 dir1
3、将目录dir1复制到dir2目录下，复制结果目录被改名为dir2
cp -r dir1 dir2
4、将目录dir1下所有文件包括文件夹，都复制到dir2目录下
cp -r dir1/*.* dir2
常见错误：
1、提示cp: omitting directory错误
复制目录时，使用-r选项即可递归拷贝，如下：
cp -r dir1 dir2


```
```
scp /home/daisy/full.tar.gz root@172.19.2.75:/home/root （然后会提示你输入另外那台172.19.2.75主机的root用户的登录密码，接着就开始copy了），复制目录加参数 -r 即可 
从 远程 复制到 本地 
scp root@/172.19.2.75:/home/root/full.tar.gz /home/daisy/full.tar.gz
```

##centos添加用户跟组
```
http://zhidao.baidu.com/link?url=YWnbBbR1fLGrWwQ9bKROr_2A_7fotpIgs2IJA0yh7-MfDDBKf3GSsB8Hab1pn0-Q8xpBnW0rSUUOhY1jIngKlX_O3-O9q2G0uIQCsANK80e
```

#centos7开机自动关闭网络,开启网络，有线设置
http://jingyan.baidu.com/article/6dad5075f3d766a123e36eaa.html
```
$ cd /etc/sysconfig/network-scirpts
$ ls
$sudo vi ifcfg-eth0
修改：
ONBOOT=yes
关闭
ONBOOT=no
```



