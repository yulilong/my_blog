## **overview**   

* **这么做的目的**     

1.用于manageiq里面azure的获取镜像信息，manageiq里面 auzre provider 获取镜像是从 存储账户中获得镜像信息，不是获得共有的镜像。            
2.共有的镜像信息很多，在这里存储后可以快速找到自己想要的镜像信息。        

* **需要提前准备的事情**      

1.在共有镜像中要到需要的镜像，使用此镜像创建一个最小的资源的（花钱最少），镜像生成后这个虚拟机就不能使用了，需要释放掉。   
2.powershell 软件已经安装好了，如果没有安装好，安装教程：https://www.azure.cn/documentation/articles/powershell-install-configure/             
3.目前的操作是基于微软中国区的操作，门户预览：https://portal.azure.cn  ，本文当的操作是在2017-02-13之前操作的。     

## **开始**     

* **创建虚拟机后关机**    
https://portal.azure.cn， 打开这个网站后选择虚拟机(Virtual machines) -> 新加一个虚拟机(add) -> 选择需要的镜像后下一步(create)，配置好CPU，内存大小，等资源信息后，生成虚拟机，稍等一会，虚拟机生成成功后，进入这个虚拟机中，选择停止这个虚拟机。      


* **对一台ARM的windows虚拟机执行sysprep【linux waagent -deprovision】，成功配置后，从管理门户关机以便释放资源**    

* **powershell login azure**     

```
$ powershell
PS C:\Users\kyxxx> Login-AzureRmAccount -EnvironmentName AzureChinaCloud
# 输入帐号密码后会显示下面信息
Environment           : AzureChinaCloud
Account               : admin@xxxxxp.xxxxxx.onmschina.cn
TenantId              : exxxxxxd-xxx8-4xxx-xxx0-xxxxxxxxxx48
SubscriptionId        : 4xxxxxxa-xxx8-4xxx-xxxc-xxxxxxxxxx48
SubscriptionName      : Windows Azure 企业
CurrentStorageAccount :
```      
* **对该虚拟机执行Generalized标记**      

```
# test-vm            : 资源组(Resource group) 
# centos7ExtractIamge: 虚拟机名字(Computer name)
PS C:\Users\kyxxx>Set-AzureRmVM -ResourceGroupName test-vm -Name centos7ExtractIamge -Generalized
# 操作成功后会显示下面信息
OperationId :
Status      :
StartTime   :
EndTime     :
Error       :
```