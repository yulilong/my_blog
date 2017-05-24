* **前端生成dist静目录**   

```
~ npm run build:prod
```   
* **生成的dist目录与Nginx目录压缩**  

把dist文件与Nginx文件放在一个文件夹里,终端进入这个文件夹，然后终端运行命令打包：   
```
~ tar czvf cloudlink-front-framework.tar dist nginx
```    
* **使用FileZilla软件把文件传到(ftp:192.168.102.104 pipeline)**

账号密码问相关人员。     

* **打开Jenkins `http://192.168.102.101:8081` shenjie** 

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