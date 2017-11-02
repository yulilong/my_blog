***目录***    

[TOC]    

-------------   

## 地图加载后不完全：  arcgis自己的样式没有加载上    

![WX20171018-143914@2x.png](https://bitbucket.org/repo/oE6yEX/images/2647111525-WX20171018-143914@2x.png)     

如上图所示，arcgis地图加载不完全，经过排查，是由于没有加载arcgis自己的CSS样式，把CSS加载上就好了。 


## 运行后，页面没有地图，地图服务报500错误   

运行网页后，页面没有地图，打开 console后看见如下信息：   

```
dojo.io.script error Error {__zone_symbol__error: Error
    at Error.g (http://192.168.100.92/polyfills.6fc95ed753dec1452ced.bundle.js:3:13200)
    at…, …}

__zone_symbol__message
:
"Error handling service request : Could not find a service with the name 'MapServer/ChinaOnlineStreetColor' in the configured clusters. Service may be stopped or ArcGIS Server may not be running."
```    

经查找，这个是地图服务发生错误，导致不能读取地图了，