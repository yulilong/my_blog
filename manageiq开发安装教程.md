# manqgeiq官方的安装文档 #

链接：  
http://manageiq.org/docs/guides/developer_setup.html  
你可以看这个官方的安装文档，这里面依赖环境安装是使用dnf管理其来安装的，我个人安装的时候会有点问题，你可以先尝试安装，如果有问题不能解决，那么可以看下面的安装教程。

# manageiq自定义安装 #

## 概述review ##

这个是文档是从一个空白电脑开始安装，如果你哪一步已经存在，请略过

## 操作系统安装 ##

manageiq要求是 centos的 linux，所以请安装centos版linux，不会请找运维的同事或者网管安装。
推荐centos7

## git安装 ##

一般git linux系统自带，可在终端运行如下命令查看系统是否安装了git：
```
$ git --version
```
如果出来版本号则说明已经安装了，如果没有安装请看如下教程安装：  

* [git安装、配置](https://bitbucket.org/yulilong/my_wiki/wiki/git%E5%AE%89%E8%A3%85%E3%80%81%E9%85%8D%E7%BD%AE)  

这里面描写了git的安装、git命令的别名、以及拉取代码时自动验证用户名密码设置。

## manageiq依赖安装 ##

官方文档使用的是dnf包管理器来安装的，但是我安装时发现有的包使用dnf找不到，只好全部用yum来安装了。

* Install packages
```
sudo yum -y install memcached                          
sudo yum -y install bzip2 libffi-devel readline-devel  
sudo yum -y install libxml2-devel libxslt-devel patch  
sudo yum -y install sqlite-devel                       
sudo yum -y install nodejs                             
sudo yum -y install gcc-c++                            
sudo yum -y install libcurl-devel                     
rpm -q --whatprovides npm || sudo yum -y install npm   
sudo yum -y install openssl-devel                     
sudo yum -y install cmake                              
```
* Install the Bower package manager
```
sudo npm install -g bower
```
* Enable Memcached
```
sudo systemctl enable memcached
sudo systemctl start memcached
```
*  PostgreSQL version is 9.4+ 的安装

postgres数据库官方推荐使用9.4+的版本，如果系统没有安装那么直接安装这个版本以上的，如果有旧的版本则先卸载在安装新的。
manageiq官方postgres9.4+的安装文档：  
http://manageiq.org/docs/guides/developer_setup/postgresql_software_collection  

```
$ sudo yum -y install centos-release-scl
$ sudo systemctl stop postgresql-server
$ sudo systemctl disable postgresql-server
$ sudo yum -y remove 'postgresql-*'
```

* 卸载ruby 链接postgres 的gem包 pg，如果没有安装则略过：
```
$ gem uninstall pg
```

* Install the PostgreSQL 9.4 collection

```
$ sudo yum -y install \
rh-postgresql94-postgresql-server \
rh-postgresql94-postgresql-devel
```
This will install the required files under /opt/rh/rh-postgresql94, so each time you need to use a command like pgsql you will have to use the complete path. Alternatively, you can enable that collection:  
```
$ scl enable rh-postgresql94 bash
$ source /opt/rh/rh-postgresql94/enable
```
注意！！！下面这步可能会把～/.bash_profile 文件里面所有内容清空，使用前请备份注意：
```
$ cat > $HOME/.bash_profile <<.
source /opt/rh/rh-postgresql94/enable
.
```
* Create and configure the database  

By default the database directory used by the software collection is /var/opt/rh/rh-postgresql94/lib/pgsql/data, but the ManageIQ instructions assume it to be /var/lib/pgsql/data. The name of the service is also different. Make sure to take these differences into account when creating and configure the database. For example, to initially create the database you will need to do the following:  
```
$ su - root
$ scl enable rh-postgresql94 bash
$ postgresql-setup initdb
```
To setup authentication you will need to modify the pg_hba.conf file, as described in the instructions, but taking into account the different location:  
```
$ PGDATA=/var/opt/rh/rh-postgresql94/lib/pgsql/data
$ sudo grep -q '^local\s' $PGDATA/pg_hba.conf || echo "local all all trust" | sudo tee -a $PGDATA/pg_hba.conf
$ sudo sed -i.bak 's/\(^local\s*\w*\s*\w*\s*\)\(peer$\)/\1trust/' $PGDATA/pg_hba.conf
```
To enable and start the server:
```
$ sudo systemctl enable rh-postgresql94-postgresql
$ sudo systemctl start rh-postgresql94-postgresql
```
And, finally, to create the database user:  
```
$ su - postgres
$ scl enable rh-postgresql94 bash
$ psql -c "CREATE ROLE root SUPERUSER LOGIN PASSWORD 'smartvm'"
```
* Configure PostgreSQL

```
sudo postgresql-setup initdb
sudo grep -q '^local\s' /var/lib/pgsql/data/pg_hba.conf || echo "local all all trust" | sudo tee -a /var/lib/pgsql/data/pg_hba.conf
sudo sed -i.bak 's/\(^local\s*\w*\s*\w*\s*\)\(peer$\)/\1trust/' /var/lib/pgsql/data/pg_hba.conf
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo -u postgres psql -c "CREATE ROLE root SUPERUSER LOGIN PASSWORD 'smartvm'"
# This command can return with a "could not change directory to" error, but you can ignore it
```
## rvm,ruby,gems,rails,pqadmin3,rubymine,isntall ##  
这里是rails开发的必要插件，具体安装看如下链接：  

* [centos7,rvm,ruby,gems,rails,pqadmin3,rubymine,isntall](https://bitbucket.org/yulilong/my_wiki/wiki/centos7,rvm,ruby,gems,rails,pqadmin3,rubymine,isntall)


## clone ManageIQ 代码 ##

```
git clone https://github.com/ManageIQ/manageiq
```

## Installs dependencies, config, prepares database, etc ##

```
$ bin/setup
```

## Starts the ManageIQ EVM Application in the background ##
下面的命令是开始启动服务，这个是正常的启动。  
```
$ bundle exec rake evm:start
$ rails server
```
## 开发环境最小配置运行 ##

```
$ MIQ_SPARTAN=minimal rake evm:start
$ rails server
```
