***目录***

[TOC]

## **前端项目生成dist目录**   

```
~ cd 项目目录
~ npm run build:prod
```   
## **生成的dist目录与Nginx目录压缩**  

把dist文件与Nginx文件放在一个文件夹里,终端进入这个文件夹，然后终端运行命令打包：   
```
~ tar czvf cloudlink-front-framework.tar dist nginx
```    
## **连接FTP上传cloudlink-front-framework.tar文件**

### **1. 使用软件链接FTP**    

使用FileZilla软件把文件传到(ftp:192.168.102.104 pipeline)
账号密码问相关人员。     

### **2. 使用终端上传文件**    

```
# 上传文件： 
~ scp /Users/dragon/web-dev/cloudlink-front-framework.tar root@192.168.102.104:/app/ftp
# 修改文件的用户与组
~ chown pipeline:pipeline /app/ftp/cloudlink-front-framework.tar
```

## **使用Jenkins部署服务 ** 

打开Jenkins `http://192.168.102.101:8081`  shenjie      
Jenkins账号密码问相关人员。       
1. 先运行`cloudlink-front-framework_Destroy` 删除旧资源。    
2. 运行`cloudlink-front-framework` 部署。    

* **修改API连接地址(需要修改的情况下)**    

1. 打开Nginx文件里面`nginx.conf`     

```
# line: 47
location ^~ /cloudlink/v1/ {
	    proxy_pass http://192.168.100.92:8050/; 
	}
```