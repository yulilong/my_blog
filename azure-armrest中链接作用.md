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
这个应该查询存储账户下面的信息，知道后更新
```
{:url=>"https://testvmdisks334.blob.core.chinacloudapi.cn/?comp=list", :headers=>{"Content-Type"=>"", "x-ms-date"=>"Tue, 24 Jan 2017 01:35:14 GMT", "x-ms-version"=>"2015-12-11", :auth_string=>true, "content-type"=>"", "auth_string"=>true, "Authorization"=>"SharedKey testvmdisks334:0KTn90jFVVekdTyW/C4nMlw7wCditXSc7j+VFlfxSBU="}, :proxy=>nil, :ssl_version=>"TLSv1", :ssl_verify=>nil, :method=>:get}
{:url=>"https://testvmdisks334.blob.core.chinacloudapi.cn/vhds?restype=container&comp=list", :headers=>{"Content-Type"=>"", "x-ms-date"=>"Tue, 24 Jan 2017 01:35:14 GMT", "x-ms-version"=>"2015-12-11", :auth_string=>true, "content-type"=>"", "auth_string"=>true, "Authorization"=>"SharedKey testvmdisks334:2CRLCongUiRYOIUI6+DRJSuPDDLUDE0DQ3MiCkBg8us="}, :proxy=>nil, :ssl_version=>"TLSv1", :ssl_verify=>nil, :method=>:get}
```      
返回结果：    
```
#<Azure::Armrest::StorageAccount::Blob:0x0000000368a1e8 name="centos7-base20170104130639.vhd", container="vhds", properties=#<Azure::Armrest::StorageAccount::Blob::Properties:0x00000003688fc8 last_modified="Wed, 04 Jan 2017 05:43:47 GMT", content_length="32212255232", content_type="application/octet-stream", content_encoding=nil, cache_control=nil, content_md5="DbNvfmFA1vHNiZdl1j8pnw==", lease_state="available", etag="0x8D43464A759CAEA", lease_status="unlocked", content_language=nil, content_disposition=nil, x_ms_blob_sequence_number="1", blob_type="PageBlob", server_encrypted="false">>
```