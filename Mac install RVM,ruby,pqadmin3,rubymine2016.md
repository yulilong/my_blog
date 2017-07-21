## **1. install RVM**   
 
1.未装homebrew先装homebrew，否则报错：     
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```      
如果有安装homebrew，但是在后面的ruby安装过程中出现如下错误,        
有可能是你更新mac系统造成的，我是通过卸载重装homebrew来解决这个问题的.       
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```     
2.安装rvm    
```
$ curl -L https://get.rvm.io | bash -s stable
# 启用RVM
$ source ~/.rvm/scripts/rvm   
# 检查一下是否安装正确命令
$ rvm -v
# 如果出现邦本则说明安装成功
```    

## **2. 安装 rubymine ruby编辑器**      

参考文档：     
http://blog.csdn.net/arabela35/article/details/53318640       
http://www.sdifenzhou.com/rubymine201612.html      

1. 下载 download      
链接: https://pan.baidu.com/s/1hr8NpZY  密码: ey5a     
链接: https://pan.baidu.com/s/1c2ou9w8 密码: kqjh        

2. 打开dmg镜像，拖动RubyMine 到 application 应用程序里       

3. 打开crack，复制jetbrainsCrack.jar      

4. 打开应用程序，右键rubymine程序 -> 显示包内容(Show Package Contents) -> 点击Contets -> 找到bin -> 点开，把刚刚复制的jetbrainsCrack.jar粘贴进去，如果打不开，则把rubymine.app复制到别的文件夹里面操作这一步。      

5. 用文本文档打开 右键rubymine程序 -> 显示包内容(Show Package Contents) -> 点击Contets -> 找到bin -> rubymine.vmoptions  添加 `-javaagent:JetbrainsCrack.jar`到行尾。    

6. 回到crack文件夹，这次点开SH.txt，复制里面内容，运行rubymine， 进入激活界面，然后三种激活方式，选择第一个”Activate Code”，在下面的框框里粘贴进刚刚复制的东西， 点击ok！成功激活！ 如果不能点ok，则第四，第五步从新操作，或者rubymine应用换个文件夹试试。         

## **rubymine 2017安装**

1. 官网现在最新安装包：  https://www.jetbrains.com/ruby/download/#section=mac     
2. 下载完成安装包后，双击打开，将左侧拖拽至右侧应用程序，默认安装。      
3. 打开软件，在注册中选择‘License server’， 在 ‘License server address’ 中输入：`http://xidea.online`,然后点击Activate即可顺利破解！

--------------------
## **Mac install pgadmin3**    

```
#终端，已经安装了brew ，cask
~ brew search pgadmin3
Caskroom/versions/pgadmin3
~ brew install Caskroom/versions/pgadmin3
```
![WX20170308-104055.png](https://bitbucket.org/repo/oE6yEX/images/3516961668-WX20170308-104055.png)     


* 修改数据库配置文件，允许连接
```
~ vi /usr/local/var/postgres/pg_hba.conf
```
找到下面的内容：
```
# IPv4 local connections:
host    all             all             127.0.0.1/32            ident
# IPv6 local connections:
host    all             all             ::1/128                 ident
```
**把ident修改为 trust** 

并在下面添加一行：
```
host	all 		all 		192.168.0.0/24 		trust
```

保存后重起数据库：
```
# 没试过，
~ pg_ctl start -D /usr/local/var/postgres/data -l /usr/local/var/log/postgres/log.log
# 停止的话把后面的start换成stop即可。 如果不想每次都指定数据目录，可以创建保存该地址的环境变量PGDATA
# export PGDATA=/usr/local/var/postgres/data
```
* 查看数据库的运行：
```
# 亲测有效
$ lsof -i:5432
```