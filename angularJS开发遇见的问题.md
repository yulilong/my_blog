### **开发环境下 `npm install` 编译进行一半就停止**    

![WX20170407-092321.png](https://bitbucket.org/repo/oE6yEX/images/3794077934-WX20170407-092321.png)    

* 问题分析：   
`npm install` 包没有安装完全，      
* 解决方法  

1. 删除项目目录下面的 `node_modules` 文件夹，然后从新运行命令：`npm install`，然后从新`npm start`，多试几次。      
2. 更换npm安装源：     
```  
# 安装npm 镜像源管理包
~ npm install nrm -g 
# 下面命令会列出npm镜像源
~ nrm ls
# 选择淘宝的镜像源
~ nrm use taobao
```   
然后从复方法一的步骤，尝试10后就不要再尝试了，说明这个方法不管用。      
3. 从同事那里把已经成功的 `node_modules` 文件夹 复制过来，放到工程目录下面，然后运行命令：
```  
# 如果操作系统不同，就需要运行下面的命令来从新绑定系统
~ npm rebuild node-sass
# 启动命令
~ npm start
```