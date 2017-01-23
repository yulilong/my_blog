* **获得订阅下面所有Storage accounts信息**          
https://management.chinacloudapi.cn/subscriptions/4b1b759a-1958-412a-90ec-d9a4959ad8bc/providers/Microsoft.Storage/storageAccounts?api-version=2016-05-01      
返回信息：    
```
{"value":[{"id":"/subscriptions/4b1b759a-1958-412a-90ec-d9a4959ad8bc/resourceGroups/test/providers/Microsoft.Storage/storageAccounts/testdiag563","kind":"Storage","location":"chinanorth","name":"testdiag563","properties":{"creationTime":"2017-01-05T02:23:12.5759270Z","primaryEndpoints":{"blob":"https://testdiag563.blob.core.chinacloudapi.cn/","file":"https://testdiag563.file.core.chinacloudapi.cn/","queue":"https://testdiag563.queue.core.chinacloudapi.cn/","table":"https://testdiag563.table.core.chinacloudapi.cn/"},"primaryLocation":"chinanorth","provisioningState":"Succeeded","statusOfPrimary":"available"},"sku":{"name":"Standard_LRS","tier":"Standard"},
```
对应的网站信息：     
![Screenshot from 2017-01-23 15-06-23.png](https://bitbucket.org/repo/oE6yEX/images/2559928105-Screenshot%20from%202017-01-23%2015-06-23.png)      

* **获取storageAccounts/testdiag563下key信息**
https://management.chinacloudapi.cn/subscriptions/4b1b759a-1958-412a-90ec-d9a4959ad8bc/resourceGroups/test/providers/Microsoft.Storage/storageAccounts/testdiag563/listKeys?api-version=2016-05-01       
返回信息：    
```
NKxXLEqWH80FIReivSMGgNb8vwUHDl47UkeZ1Xm3LfPIazV+FhtRmTt56rTsy7EjhA9dVh0H+YrB5nZxBigMww==
```