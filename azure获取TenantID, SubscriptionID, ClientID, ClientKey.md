###  [**return home**](https://bitbucket.org/yulilong/my_wiki/wiki/Home)
## **overview** ##
在获得软件开发帐号之前，需要准备的工作：     

* 有azure国内国外的服务器帐号。    
* 有订阅ID，这个需要自己去申请订阅ID，只有试用的才免费，其他都是收费的。    
* powershell工具，根据系统的不同安装也不同，具体见下面的教程。      


### ***powershell install***

使用教程：     
https://www.azure.cn/documentation/articles/powershell-install-configure/     
安装教程：   
https://github.com/PowerShell/PowerShell        
https://github.com/PowerShell/azure-powershell           
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
http://www.cnblogs.com/hengwei/p/5804139.html         
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
* azure中国的获得      
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
Account               : xxxxxxxxxxxx@jasgroup.partner.onmschina.cn
TenantId              : e6e48f7d-3248-4a18-8ff0-xxxxxxxxxxxx
SubscriptionId        : 4b1b759a-1958-412a-90ec-xxxxxxxxxxxx
SubscriptionName      : Windows Azure 企业
CurrentStorageAccount : 

>Set-AzureRmContext -SubscriptionId 4b1b759a-1958-412a-90ec-xxxxxxxxxxxx
>$azureAdApplication = New-AzureRmADApplication -DisplayName "webapp01" -HomePage "https://www.webapp01.xxxxxxxxxxxx.cn" -IdentifierUris "https://www.xxxxxxxxxxxx.org/webapp01" -Password "cloud@1qaz@xxx"
> $azureAdApplication

# ClientKey: 就是上面设置的密码 cloud@1qaz@xxx
# ClientID : 就是下面的ApplicationId

DisplayName             : webapp01
ObjectId                : 201a9648-6b80-40ce-8b7c-xxxxxxxxxxxx
IdentifierUris          : {https://www.xxxxxxxxxxxx.org/webapp01}
HomePage                : https://www.webapp01.xxxxxxxxxxxx.cn
Type                    : Application
ApplicationId           : 409a871d-b24f-4bef-ac8f-xxxxxxxxxxxx
AvailableToOtherTenants : False
AppPermissions          :
ReplyUrls               : {}



> New-AzureRmADServicePrincipal -ApplicationId $azureAdApplication.ApplicationId

DisplayName                    Type                           ObjectId
-----------                    ----                           --------
webapp01                       ServicePrincipal               ee14f618-e3b2-466b-9ff7-82xxxxxxxxxxx

# 给这个app设置相应的 订阅ID权限
> New-AzureRmRoleAssignment -RoleDefinitionName Reader -ServicePrincipalName $azureAdApplication.ApplicationId


RoleAssignmentId   : /subscriptions/4b1b759a-1958-412a-90ec-xxxxxxxxxxxx/providers/Microsoft.Authorization/roleAssignments/ae74b507-19e3-4e0a-8e84-xxxxxxxxxxxx
Scope              : /subscriptions/4b1b759a-1958-412a-90ec-xxxxxxxxxxxx
DisplayName        : webapp01
SignInName         :
RoleDefinitionName : Reader
RoleDefinitionId   : acdd72a7-3385-48ef-bd42-xxxxxxxxxxxx
ObjectId           : ee14f618-e3b2-466b-9ff7-xxxxxxxxxxxx
ObjectType         : ServicePrincipal

> Get-AzureRmRoleAssignment

RoleAssignmentId   : /subscriptions/4b1b759a-1958-412a-90ec-xxxxxxxxxxxx/providers/Microsoft.Authorization/roleAssignments/ae74b507-19e3-4e0a-8e84-xxxxxxxxxxxx
Scope              : /subscriptions/4b1b759a-1958-412a-90ec-xxxxxxxxxxxx
DisplayName        : webapp01
SignInName         :
RoleDefinitionName : Reader
RoleDefinitionId   : acdd72a7-3385-48ef-bd42-xxxxxxxxxxxx
ObjectId           : ee14f618-e3b2-466b-9ff7-xxxxxxxxxxxx
ObjectType         : ServicePrincipal
```     

* azure国外获得     
```
PS C:\Users\xxxx> Login-AzureRmAccount
VERBOSE: To sign in, use a web browser to open the page 
https://aka.ms/devicelogin and enter the code GTMMSNYNX to authenticate.

# 这里打开这个连接，然后输入后面的代码，之后输入帐号，密码后就会出现下面的信息。
# TenantID，SubscriptionID在下面

Environment           : AzureCloud
Account               : kylin_fedora@hotmail.com
TenantId              : 73931c80-2096-4efa-a21c-xxxxxxxxxxxx
SubscriptionId        : 3b22ed16-6255-4eb4-b808-xxxxxxxxxxxx
SubscriptionName      : 即用即付
CurrentStorageAccount :



PS C:\Users\xxxx> Set-AzureRmContext -SubscriptionId 3b22ed16-6255-4eb4-b808-xxxxxxxxxxxx

PS C:\Users\xxxx> $azureAdApplication = New-AzureRmADApplication -DisplayName "webapp01" -HomePage "https://www.webapp01.xxxxxxxxxxxx.cn" -IdentifierUris "https://www.xxxxxxxxxxxx.org/webapp01" -Password "cloud@1qaz@xxx"
PS C:\Users\xxxx> $azureAdApplication
# ClientKey: 就是上面设置的密码 cloud@1qaz@xxx
# ClientID : 就是下面的ApplicationId

DisplayName             : webapp01
ObjectId                : f31dc940-54af-49be-9c17-xxxxxxxxxxxx
IdentifierUris          : {https://www.xxxxxxxxxxxx.org/webapp01}
HomePage                : https://www.webapp01.xxxxxxxxxxxx.cn
Type                    : Application
ApplicationId           : 8ba1064d-d53c-4ad3-82e2-xxxxxxxxxxxx
AvailableToOtherTenants : False
AppPermissions          :
ReplyUrls               : {}



PS C:\Users\kylin> New-AzureRmADServicePrincipal -ApplicationId $azureAdApplication.ApplicationId

DisplayName                    Type                           ObjectId
-----------                    ----                           --------
webapp01                       ServicePrincipal               1757c1ee-12bb-4e62-9ef4-xxxxxxxxxxxx


# 给这个app设置相应的 订阅ID权限
PS C:\Users\kylin> New-AzureRmRoleAssignment -RoleDefinitionName Reader -ServicePrincipalName $azureAdApplication.ApplicationId


RoleAssignmentId   : /subscriptions/3b22ed16-6255-4eb4-b808-xxxxxxxxxxxx/providers/Microsoft.Authorization/roleAssignments/fc911348-23cc-4329-bbc4-xxxxxxxxxxxx
Scope              : /subscriptions/3b22ed16-6255-4eb4-b808-xxxxxxxxxxxx
DisplayName        : webapp01
SignInName         :
RoleDefinitionName : Reader
RoleDefinitionId   : acdd72a7-3385-48ef-bd42-xxxxxxxxxxxx
ObjectId           : 1757c1ee-12bb-4e62-9ef4-xxxxxxxxxxxx
ObjectType         : ServicePrincipal



PS C:\Users\kylin> Get-AzureRmRoleAssignment


RoleAssignmentId   : /subscriptions/3b22ed16-6255-4eb4-b808-xxxxxxxxxxxx/providers/Microsoft.Authorization/roleAssignments/fc911348-23cc-4329-bbc4-xxxxxxxxxxxx
Scope              : /subscriptions/3b22ed16-6255-4eb4-b808-xxxxxxxxxxxx
DisplayName        : webapp01
SignInName         :
RoleDefinitionName : Reader
RoleDefinitionId   : acdd72a7-3385-48ef-bd42-xxxxxxxxxxxx
ObjectId           : 1757c1ee-12bb-4e62-9ef4-xxxxxxxxxxxx
ObjectType         : ServicePrincipal

```
赋予应用ID操作订阅ID权限的命令:            
        
Owner has full access to all resources including the right to delegate access to others.              
Contributor can create and manage all types of Azure resources but can’t grant access to others.            
Reader can view existing Azure resources.