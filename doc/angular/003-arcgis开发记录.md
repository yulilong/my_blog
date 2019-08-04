***目录***     

[TOC]  

------------

## **arcgis JavaScript API安装**    

### 1. arcgisAPI下载地址：https://developers.arcgis.com/downloads/      

1. 打开网站后选择‘ArcGIS API for JavaScript’，如果不要最新版则点击后面的‘All versions’，选择一个自己需要的版本。     
2. [**4.4版本的下载地址**](https://esrisoftware.esri.com/akdlm/software/ArcGIS_JavaScript/4.4/arcgis_js_v44_api.zip?downloadID=7209648462&type=sms&agolUsername=NA&receiptId=downloads.arcgis.com&__gdb__=1502951400_100810443d32051c7c6c539c381ad892&ext=.zip)     

       
### 2. 4.4版本API：本地配置    

1. 下载好后，把解压后的文件中 library目录拷贝到 angular2的src目录下(与index.html同级)，

* 打开文件library/4.4/dojo/dojo.js     

```
baseUrl:"http://localhost:3000/library/4.4/dojo",hasCache:{"config-deferredInstrumentation":0,"config-selectorEngine":"acme",
```

搜索内容 `https://[HOSTNAME_AND_PATH_TO_JSAPI]dojo`  把这个字符串替换成 `http://localhost:3000/library/4.4/dojo`   
保存后退出。     

* 打开文件library/4.4/init.js      

搜索内容 `https://[HOSTNAME_AND_PATH_TO_JSAPI]dojo`  把这个字符串替换成 `http://localhost:3000/library/4.4/dojo`   
保存后退出。   

### 3. 3.18版本修改方法       

* 打开文件library/4.4/dojo/dojo.js     

```
baseUrl:((location.protocol === 'http:' || location.protocol === 'https:') ? location.protocol : 'http:') + '//' + "localhost:3000/library/3.18/dojo",hasCache:{"config-selectorEngine":"acme",
```

搜索内容 `[HOSTNAME_AND_PATH_TO_JSAPI]`  把这个字符串替换成 `localhost:3000/library/4.4/dojo`   
保存后退出。     
***注意：***一定不要加`http://`      


* 打开文件library/4.4/init.js      

搜索内容 `[HOSTNAME_AND_PATH_TO_JSAPI]`  把这个字符串替换成 `localhost:3000/library/4.4/dojo`   
保存后退出。   
***注意：***一定不要加`http://`      

* 测试API是否成功    

启动服务后，在浏览器中输入网址： http://localhost:3000/library/4.4/init.js      
如果有返货内容则说明部署成功。   

-----------    

## **angular2中加载arcgis JS API**   

angular2里面需要先安装 arcgis 的包 

```
# 介绍： https://www.npmjs.com/package/angular2-esri-loader
npm install angular2-esri-loader esri-loader
```

在组件中加载 arcgis的 API， 加载好后就可以在其他方法中直接使用了：

```
private loadEsriModules() {
    //来自：https://github.com/StefanNieuwenhuis/awesome-mapping-app
    this.esriLoader.load({
      // url: 'https://js.arcgis.com/4.4/'
    }).then(() => {
      this.esriLoader.loadModules([
        'esri/Map',
        'esri/layers/MapImageLayer',    //地图 图层服务
        'esri/views/MapView',           //2D地图
        'esri/views/SceneView',         //3D地图
        //https://developers.arcgis.com/javascript/latest/api-reference/esri-layers-FeatureLayer.html#source
        "esri/layers/FeatureLayer",     //提取图层服务
        "esri/widgets/Home",            //在视图中出现一个回到原点的按钮Home
        "esri/widgets/BasemapGallery",
        "esri/widgets/Expand",
        "esri/widgets/Search",//地点搜索
        "esri/widgets/ScaleBar",//比例尺
        "esri/core/watchUtils", //鹰眼图
        "dojo/dom",             //鹰眼图
      ]).then(([Map, MapImageLayer, MapView, SceneView, FeatureLayer, Home,
                 BasemapGallery, Expand, Search, ScaleBar, watchUtils, dom]) => {
        this.esriMap = Map;
        this.esriMapImageLayer = MapImageLayer;
        this.esriMapView = MapView;
        this.esriSceneView = SceneView;
        this.esriFeatureLayer = FeatureLayer;
        this.esriHome = Home;
        this.esriBasemapGallery = BasemapGallery;
        this.esriExpand = Expand;
        this.esriSearch = Search;
        this.esriScaleBar = ScaleBar;
        this.esriwatchUtils = watchUtils;
        this.esridom = dom;
        this.arcGisLoadFinish = true;
      })
    })
  }
```

## ** arcgis加载图层 并显示图层上点的信息**   

参考链接：https://developers.arcgis.com/javascript/latest/sample-code/featurelayerview-query/index.html       

### **使用图层上默认的参数，来显示图层上点的信息**    

```
addMapLayre() {
    this.view.map.removeAll();
    let popupTemplate = {
        title: 'Cities',
        content: "<p> 城市: {CITY_NAME}</p>" +
        "<p> LABEL_FLAG: {LABEL_FLAG}</p>" +
        "<p> OBJECTID: {OBJECTID}</p>" +
        "<p> POP: {POP}</p>" +
        "<p> POP_CLASS: {POP_CLASS}</p>" +
        "<p> POP_RANK: {POP_RANK}</p>"
      };
    for (let e of this.layerBtnListsSelect) {
      if (e.data && e.data.url) {
        //https://developers.arcgis.com/javascript/latest/api-reference/esri-layers-FeatureLayer.html#properties-summary
        let layer = new this.esriFeatureLayer({
          outFields: ["*"],             //把每个点的所有属性都查询出来。
          popupTemplate: popupTemplate, //弹窗模板
          url: e.data.url               //图层服务地址
        });
        this.view.map.add(layer);  // adds the layer to the map
        //下面注销掉的代码可以查看全部点的信息
        // this.view.whenLayerView(layer).then(function (lyrView) {
        //   lyrView.watch("updating", function (val) {
        //     if (!val) {  // wait for the layer view to finish updating
        //       lyrView.queryFeatures().then(function (results) {
        //         console.log(results);  // prints all the client-side graphics to the console
        //       });
        //     }
        //   });
        // });
      }
    }

  }
```    

使用这个方法好处 ：简单，方便。        
坏处： 1. 要根据不同的图层来制作不同的弹窗模板。  2. 弹窗样式固定。

### **更好的方案： 使用 arcgis 地图的 点击事件，来个性化弹窗**    

参考链接：https://geonet.esri.com/message/609517#comment-609517        

https://developers.arcgis.com/javascript/latest/api-reference/esri-views-View.html#on      

```
let _view = this.view;
this.view.on("click", function (event) {
  _view.hitTest(event.screenPoint).then(function (response) {
    var graphics = response.results;
    graphics.forEach(function (graphic) {
       console.log(graphic);
     });
  });
});
```

在这里使用view 的 on事件，当点击地图上一个点的时候，如果这个点事图层上的点，则会出发这个事件， 如果不是，则没有有反应。    
一个例子： https://developers.arcgis.com/javascript/latest/sample-code/view-hittest/index.html       


### **添加图层的时候可以调用方法，把所有点的 信息全部得到**    

https://developers.arcgis.com/javascript/latest/api-reference/esri-layers-FeatureLayer.html#querying   

```
// returns all the graphics from the layer view
// lyr: 创建的图层 new FeatureLayer({...})
view.whenLayerView(lyr).then(function(lyrView){
  lyrView.watch("updating", function(val){
    if(!val){  // wait for the layer view to finish updating
      lyrView.queryFeatures().then(function(results){
        console.log(results);  // prints all the client-side graphics to the console
      });
    }
  });
}); 
```


## **arcgis地图坐标系**。  

参考链接： 

https://developers.arcgis.com/javascript/3/jsapi/screenpoint-amd.html        
https://developers.arcgis.com/javascript/latest/api-reference/esri-Viewpoint.html    
 
 

### 没毛病