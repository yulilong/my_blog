***目录***     

[TOC]  

------------

## **arcgisAPI安装**    

arcgis API下载：  https://developers.arcgis.com/downloads/      

https://esrisoftware.esri.com/akdlm/software/ArcGIS_JavaScript/4.4/arcgis_js_v44_api.zip?downloadID=7209648462&type=sms&agolUsername=NA&receiptId=downloads.arcgis.com&__gdb__=1502951400_100810443d32051c7c6c539c381ad892&ext=.zip       

*  下载好后，把解压后的文件中 library目录拷贝到 angular2的src目录下(与index.html同级)，

* 打开文件library/4.4/dojo/dojo.js     

搜索内容 `https://[HOSTNAME_AND_PATH_TO_JSAPI]dojo`  把这个字符串替换成 `http://localhost:3000/library/4.4/dojo`   
保存后退出。     

* 打开文件library/4.4/init.js      

搜索内容 `https://[HOSTNAME_AND_PATH_TO_JSAPI]dojo`  把这个字符串替换成 `http://localhost:3000/library/4.4/dojo`   
保存后退出。   

* 测试API是否成功    

启动服务后，在浏览器中输入网址： http://localhost:3000/library/4.4/init.js      
如果有返货内容则说明部署成功。   

-----------