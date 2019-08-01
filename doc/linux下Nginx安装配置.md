[TOC]



## 1. 安装

通过命令 apt-get install 安装软件，通过安装 nginx 示例如下：

```
$ apt-get install nginx
```

如果安装时遇到下面错误：

```
E: Unable to locate package nginx
```

执行`sudo apt-get update`命令更新软件源后再安装即可。

软件安装完成后，通过通过 *dpkg -L* 列出软件包所在的目录，及该软件包中的所有文件：

```
$ dpkg -L nginx
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/nginx
/usr/share/doc/nginx/copyright
/usr/share/doc/nginx/changelog.Debian.gz

$ whereis nginx
nginx: /usr/sbin/nginx /etc/nginx /usr/share/nginx
```

### 1.1 启动Nginx

sudo systemctl start nginx

### 1.2 开机自动启动nginx 服务

sudo systemctl enable nginx

### 1.3 关闭开机自动启动nginx 服务

sudo systemctl disable nginx

### 1.4 重启Nginx服务

nginx -s reload

或者：

sudo systemctl restart nginx

### 15 查看Nginx服务

ps -ef|grep nginx

## 2. 配置

配置目录：/etc/nginx/nginx.conf

终端打开配置文件：

```
vi /etc/nginx/nginx.conf
```



```
user www-data;
worker_processes auto;
pid /run/nginx.pid;

events {
	worker_connections 768;
	# multi_accept on;
}

http {
	server {
		listen		80;	#port
		server_name	47.104.24.148 www.dragon.com dragon.com;
		location / {
			root	/website/dist;
			index	index.html index.htm;
		}
	}
}
```

配置主要是在http里面的 server，其中参数：

- listen：监听的端口
- server_name：监听的服务名字，以空格间隔
- location：访问服务的路径

保存后终端域名命令`nginx -s reload`重启Nginx来生效命令

