## dnf -y install memcached Failed to open:
```
http://stackoverflow.com/questions/32541196/i-attempted-to-enable-the-epel-repo-on-my-fedora-22-machine-and-i-broke-it-now

This is what appears to have worked for me.

Remove the epel repo

rm -rf /etc/yum.repos.d/epel*

then try install epel via dnf

dnf clean all dnf install epel-release

注：
如果删除了/etc/yum.repos.d/epel* ，那么一旦dnf命令安装失败，然后用yum安装，那么就要恢复删除的这些选项。
```
#tar uncompress xxx.tar.xz
```
tar xf archive.tar.xz
tar xf archive.tar.gz
tar xf archive.tar
```
#sudo dnf -y install nodejs ,error :no package matched: nodejs
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
# sudo dnf -y install npm 如果安装失败
```
尝试是使用yum安装，
$ sudo yum -y install npm
如果yum也提示没有，那么更新yum源
```