[TOC]

## 1. centos 部署samba

```
1.安装Samba
# yum -y install samba samba-client samba-common
2.selinux 设为警告模式
# setenforce 0
3.创建共享目录 
# mkdir -p /home/smb/share_folder
4.(可不用)配置内核参数 # ulimit -n 16384
		       # vi /etc/security/limits.conf
		       #在最后加入以下内容
		       * - nofile 16384
注：这主要是避免在启动samba出现1024警告信息

5.进入samba目录下备份配置文件 # cd /etc/samba
			      # cp smb.conf smb.conf.bak
6.编辑smb.conf,删除原所有内容添加以下内容：

[global]
  workgroup = SDYTKFQDD
  netbios name = YTKFQDJJ
  server string = Samba Server
  #security = share
  sercurity = user
  map to guest = Bad User
[smb]
  path = /home/smb/myself
  public = no
  writable = yes
  write list = @myself

7.创建用户并分配权限

//创建操作系统用户
  useradd myself
//创建samba用户
  smbpasswd -a myself
//修改目录权限
  chgrp myself /home/smb/myself/
  chmod 774 /home/smb/myself/
//查看权限是否生效
  ll -d /home/smb/myself/
//重启samba服务并加到开机自启动
  systemctl restart smb
  systemctl enable smb
//查看samba运行状态
  systemctl status smb
//将samba服务添加到防火墙，否则其他电脑无法访问，并重启防火墙
  firewall-cmd --permanent --zone=public --add-service=samba
  firewall-cmd --reload
//设置好win7的ip与centos7在同一网段内，开始--运行--输入\\服务器IP 即可看到共享文件了
```

## 2. centos7 连接服务器

```
1.查看samba服务器有那些文件夹
$ smbclient -L 192.168.1.44 -U myself
192.168.1.44:服务器的地址，改为你自己服务器的地址
myself： samba的用户

2.连接samba
$ smbclient //192.168.1.44/smb -U myself
192.168.1.44:服务器的地址，改为你自己服务器的地址
smb：文件夹
myself： samba的用户

2.连接后文件上传与下载
连接后是ftp形式的，ftp命令：
1．FTP服务器的登陆
匿名用户：FTP 口令：FTP
用户：ANONYMOUS 口令：任何电子邮件
2．显示文件信息：DIR/LS
3．下载文件：GET 文件名（下载到当前目录）
4．上传文件：PUT 文件名
5．多文件下载：MGET
6．多文件上传：MPUT
7．退出：BYE
8．帮助：HELP
ls 列出远程机的当前目录
cd 在远程机上改变工作目录
lcd 在本地机上改变工作目录
ascii 设置文件传输方式为ASCII模式
binary 设置文件传输方式为二进制模式
close 终止当前的ftp会话
hash 每次传输完数据缓冲区中的数据后就显示一个#号
get（mget） 从远程机传送指定文件到本地机
put（mput） 从本地机传送指定文件到远程机
open 连接远程ftp站点
断开与远程机的连接并退出ftp
? 显示本地帮助信息
! 转到Shell中
```

