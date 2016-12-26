# manageiq 环境一体化虚拟机下载 #
http://manageiq.org/download/     
在这里选好一个系统，如redhat，vmware虚拟机，这里下载好，可以直接在虚拟机中运行，环境已经搭配好。

# fileZilla的安装 #
服务器已经有了，此时需要把开发好的代码上传到服务器运行，使用filezilla软件可以连接服务器并修改文件。   
* centos系统下 下载filezilla    
1.在 Application Installer 软件中心搜索 filezilla，如果能搜索出来，那么至今诶点击安装。     
2.如果没有那么在终端运行命令：    
```
## http://linux.it.net.cn/CentOS/course/2016/0401/20899.html  
$ sudo yum install –y filezilla
```     

## filezilla的设置 ##

* 连接服务器    
打开软件后，输入host、username、password,port一般输入22，然后点快速连接。      
* 软件语言设置    
edit -> settings -> language，然后在里面找和中文(Chinese(Simplified)(zh_CN) )、英文。      
* 编辑.rb文件的编辑器设置    
编辑 -> 设置 -> 文件编辑 -> 文件格式关联，在里面添加：
```
rb /usr/bin/gedit
```


