## **overview** ##
在获得软件开发帐号之前，需要准备的工作：     

* 有azure国内国外的服务器帐号。    
* 有订阅ID，这个需要自己去申请订阅ID，只有试用的才免费，其他都是收费的。    
* powershell工具，根据系统的不同安装也不同，具体见下面的教程。      


### ***powershell install***

* 安装教程：   
https://github.com/PowerShell/PowerShell
里面有各种系统的安装教程，下面以centos linux 为例说明。      

* install     
```
$ sudo yum install https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0_alpha.14-1.el7.centos.x86_64.rpm
```     
* Uninstallation       
```
$ sudo yum remove powershell
```    
* run     
```
$ powershell  # run
$ exit        #exit powershell
```



## 微软国内帐号获得Tenant ID, Subscription ID, Client ID, Client Key ##