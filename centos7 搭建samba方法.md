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