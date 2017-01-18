## **overview** ##
在获得软件开发帐号之前，需要准备的工作：     

* 有azure国内国外的服务器帐号。    
* 有订阅ID，这个需要自己去申请订阅ID，只有试用的才免费，其他都是收费的。    
* powershell工具，根据系统的不同安装也不同，具体见下面的教程。      


### ***powershell install***

* 安装教程：   
https://github.com/PowerShell/PowerShell        
里面有各种系统的安装教程，下面以centos linux 为例说明。      
     
```
# install
$ sudo yum install https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0_alpha.14-1.el7.centos.x86_64.rpm
     
# Uninstallation       
$ sudo yum remove powershell
   
# run     
$ powershell               # run
PS /home/user_name> exit   #exit powershell
```     

* install powershell Azure Module    
```
$ su root                                       #这个要在root用户权限下安装才有效，普通用户安装失败 
$ mkdir -p /usr/local/share/powershell/Modules  #创建PowerShell Moudle的安装目录
$ powershell                                    # 进入PowerShell环境
#  安装Azure包
PS user_name>Install-Package -Name AzureRM.NetCore.Preview -Source https://www.powershellgallery.com/api/v2 -ProviderName NuGet -ExcludeVersion -Destination /usr/local/share/powershell/Modules
# Import Azure包
PS user_name> Import-Module AzureRM.NetCore.Preview
```

## 微软国内帐号获得Tenant ID, Subscription ID, Client ID, Client Key ##

```
[yu@localhost ~]$ powershell
PowerShell 
Copyright (C) 2016 Microsoft Corporation. All rights reserved.

PS /home/yu> Login-AzureRmAccount -EnvironmentName AzureChinaCloud        
VERBOSE: To sign in, use a web browser to open the page 
https://aka.ms/deviceloginchina and enter the code A2LExxxxx to authenticate.
# 这里打开这个连接，然后输入后面的代码，之后输入帐号，密码后就会出现下面的信息。
# TenantID，SubscriptionID在下面
Environment           : AzureChinaCloud
Account               : cloudsupport@jasgroup.partner.onmschina.cn
TenantId              : e6e48f7d-3248-4a18-8ff0-863634cxxxxx
SubscriptionId        : 4b1b759a-1958-412a-90ec-d9a4959xxxxx
SubscriptionName      : Windows Azure 企业
CurrentStorageAccount : 

```