[TOC]



## 1. SSH

### 1.1 SSH不能连接并提示REMOTE HOST IDENTIFICATION HAS CHANGED解决

错误信息：     

```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HASCHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.....
....
Add correcthost key in /root/.ssh/known_hosts to get rid of this message.
Offending keyin /root/.ssh/known_hosts:15   #主要看这里，这里是存放ssh主机信任的地方，找到，然后删除这儿ssh地址就好了
RSA host keyfor 192.168.0.252 has changed and you have requested strict checking.
Host keyverification failed.
rsync:connection unexpectedly closed (0 bytes received so far) [sender]
rsync error:error in rsync protocol data stream (code 12) at io.c(359)
```

的解决办法：    
vi /root/.ssh/known_hosts     
找到要连接的主机的ip，把它的那行所有信息删除（就是一行）     
http://www.linuxidc.com/Linux/2012-07/64941.htm      

### 1.2 ssh: connect to host 192.168.123.123 port 22: Connection refused

1.linux中打开终端    
```bash
$ netstat -ntlp  # 查看所有端口，如果里面没有22端口则尝试重启ssh
# 重启ssh
$ sudo systemctl restart sshd
# 一般来说到这里就可以，如果不行请查找别的方法，
```

## 1.dnf -y install memcached Failed to open:

```
http://stackoverflow.com/questions/32541196/i-attempted-to-enable-the-epel-repo-on-my-fedora-22-machine-and-i-broke-it-now

This is what appears to have worked for me.

Remove the epel repo

rm -rf /etc/yum.repos.d/epel*

then try install epel via dnf

dnf clean all dnf install epel-release

注：
如果删除了/etc/yum.repos.d/epel* ，那么一旦dnf命令安装失败，然后用yum安装，那么就要恢复删除的这些选项。
可先给yum.repos.d 文件夹做一个备份，如果dnf安装失败，则用yum安装，这个时候恢复这个文件夹。
```
## 2. tar uncompress xxx.tar.xz

```
tar xf archive.tar.xz
tar xf archive.tar.gz
tar xf archive.tar
.tar.gz 格式解压为 tar -zxvf xx.tar.gz
.tar.bz2 格式解压为 tar -jxvf xx.tar.bz2

```
* uncompress xxx.rar
http://blog.csdn.net/alpha_xiao/article/details/52238962
```
$ wget http://www.rarsoft.com/rar/rarlinux-3.9.3.tar.gz  
$ tar -xvf rarlinux-3.9.3.tar.gz  
$ cd rar  
$ sudo make
看见下面这些信息就是安装成功了
mkdir -p /usr/local/bin
mkdir -p /usr/local/lib
cp rar unrar /usr/local/bin
cp rarfiles.lst /etc
cp default.sfx /usr/local/lib
运行命令rar时,出现下面这个问题
rar: /lib/i686/nosegneg/libc.so.6: version `GLIBC_2.7' not found (required byrar)
解决办法：
$ cp rar_static /usr/local/bin/rar
解壓：
$ rar x vpsyou.rar  //解压 vpsyou.rar 到当前目录
$ rar vpsyou.rar ./vpsyou.com/   //将 vpsyou.com 目录打包为vpsyou.rar
```

## 3. sudo dnf -y install nodejs ,error :no package matched: nodejs

```
1. 去官网下载安装
https://nodejs.org/
2.如果官网的没有办法安装，
https://www.unixmen.com/install-node-js-centos-7/
参考这个例子，但可以去github源码网站clone下载
https://github.com/nodejs/node 
git clone 
git checkout v4.6.1
然后切换到官网的版本。
sudo yum install gcc gcc-c++
./configure
make
sudo make install
node --version
如果出现了版本号，则说明安装成功了。
```
## 4. sudo dnf -y install npm 如果安装失败

```
尝试是使用yum安装，
$ sudo yum -y install npm
如果yum也提示没有，那么更新yum源
```
## 5. sudo yum update

```
error info:
警告：/var/cache/yum/x86_64/7/elrepo-kernel/packages/python-perf-4.8.4-1.el7.elrepo.x86_64.rpm: 头V4 DSA/SHA1 Signature, 密钥 ID baadae52: NOKEY
从 file:///etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org 检索密钥
获取 GPG 密钥失败：[Errno 14] curl#37 - "Couldn't open file /etc/pki/rpm-gpg/RPM-GPG-KEY-elrepo.org"

process result
http://elrepo.org/tiki/tiki-index.php
$ rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

1.如果导入失败，则手动下载，然后把文件复制到 /etc/pki/rpm-gpg/

```

## 6. 在安装好manageiq 跟rvm后 重起后输入密码后重新输入错误

* bashrc 脚本被清除了
原本：
```
# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
# User specific aliases and functions
```
如果没有这一段，那么首先用root用户登陆，然后进入用户目录把这段加上。

* $HOME/.bash_profile 里面缺少下面这段代码：
```
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
```
如果缺少这段代码，那么复制这段代码到里面。

* 导致这个问题的原因：     
http://manageiq.org/docs/guides/developer_setup/postgresql_software_collection

里面的这段话：
```
source /opt/rh/rh-postgresql94/enable
It is good idea to add this to your personal .bash_profile:
$ cat > $HOME/.bash_profile <<.
source /opt/rh/rh-postgresql94/enable
.
```
还有 .bsahrc里面的内容也不能少                 

## 7. centos gnome 桌面崩溃

1. 键盘按 control + alt + F2
2. root登陆后，切换到个人用户
3. $ systemctl restart gdm.service
4.切回桌面： control + alt + F1