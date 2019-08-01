[TOC]

--------------
## **1、开发环境下 `npm install` 编译进行一半就停止**    

![npm install 安装不完全](https://git.oschina.net/uploads/images/2017/0727/163429_47250b5d_1435979.png "WX20170407-092321.png")

* 问题分析：   
`npm install` 包没有安装完全，      
* 解决方法  

1. 删除项目目录下面的 `node_modules` 文件夹，运行命令：`npm install`，`npm start`，多试几次。      
2. 更换npm安装源：     
```  
# 安装npm 镜像源管理包
~ npm install nrm -g 
# 下面命令会列出npm镜像源
~ nrm ls
# 选择淘宝的镜像源
~ nrm use taobao
```   
然后从复方法一的步骤，尝试10次后就不要再尝试了，说明这个方法不管用。      
3. 从同事那里把已经成功的 `node_modules` 文件夹 复制过来，放到工程目录下面，然后运行命令：
```  
# 如果操作系统不同，就需要运行下面的命令来从新绑定系统
~ npm rebuild node-sass
# 启动命令
~ npm start
```  

-----------

##  **2、 __WEBPACK_EXTERNAL_MODULE_XX__ is not defined** 

解决方法：      
https://stackoverflow.com/questions/39103483/uncaught-referenceerror-webpack-external-module-xx-is-not-defined/39105605#39105605          
The solution was to set libraryTarget: 'amd' in the webpack.config.js file like so:        
```

output: {
    filename: 'dist/[name].bundle.js',
    libraryTarget: 'amd'
},
```     

---------
##  **3、Angular2管理外部类型定义和处理“Duplicate identifier” TypeScript错误**      

https://segmentfault.com/a/1190000007560996    

-----------
## **4、Module build failed: TypeError: Cannot read property 'exclude' of undefined**     

  
![错误图片](https://git.oschina.net/uploads/images/2017/0727/164019_97c78bd8_1435979.png "WX20170619-142138.png")

这个错误是由于`awesome-typescript-loader` package导致的，解决方法：    
编辑文件`~/node_modules/awesome-typescript-loader/dist/instance.js`:    
https://github.com/s-panferov/awesome-typescript-loader/issues/293        
大约是142行，替换applyDefaults 函数体内容：      

```
function applyDefaults(configFilePath, compilerConfig, loaderConfig) {
_.defaults(compilerConfig.options, {
        sourceMap: true,
        verbose: false,
        skipDefaultLibCheck: true,
        suppressOutputPathCheck: true
    });

    if (loaderConfig.transpileOnly) {
        compilerConfig.options.isolatedModules = true;
    }

    _.defaults(compilerConfig.options, {
        sourceRoot: compilerConfig.options.sourceMap ? process.cwd() : undefined
    });

    _.defaults(loaderConfig, {
        sourceMap: true,
        verbose: false,
    });

    delete compilerConfig.options.outDir;
    delete compilerConfig.options.inlineSourceMap;
    delete compilerConfig.options.outFile;
    delete compilerConfig.options.out;
    delete compilerConfig.options.noEmit;
}
```     
保存后，从新运行命令 npm start即可解决问题。      

--------------

##  **5、Node Sass does not yet support your current environment: OS X 64-bit with Unsupported runtime**     

![输入图片说明](https://git.oschina.net/uploads/images/2017/0727/164751_57184ea9_1435979.png "WX20170721-174654.png")        

根据链接：https://github.com/sass/node-sass/releases/tag/v3.13.1          
可知道是node版本太高了，卸载node后，下载低版本的node即可解决问题。      

------------
##  **6、Node Sass could not find a binding for your current environment: OS X 64-bit with Node.js 6.x**    

![输入图片说明](https://git.oschina.net/uploads/images/2017/0727/170926_0fdc6f9f_1435979.png "WX20170721-174928.png")      

根据错误提示,终端运行`npm rebuild node-sass`即可解决这个问题。      

------------
## **7、DI错误**      

![输入图片说明](https://git.oschina.net/uploads/images/2017/0728/094058_21ba4ca1_1435979.png "WX20170721-181444@2x.png")    

这个错误由于使用了服务， 但是这个服务没有引入到模块中，找到服务，并把服务引入到模块中就好。    

------------- 
##  **8. error：cannot find defined file ‘jquery’**   

运行`npm start`时报错，错误信息：        
```
@types\fullcalendar\index.d.ts
cannot find type definition file for 'jquery',
Module ''*'' has no exported member 'Duration'
Module ''*'' has no exported member 'Moment'

```

解决方案：  在tsconfig.json 文件中 添加下面语句：          

```
"typeRoots": [
            "node_modules/@types"
        ],
```

------------
##  **9. Error: No NgModule metadata found for '[object Object]'**      

![输入图片说明](https://git.oschina.net/uploads/images/2017/0724/095045_4cce0018_1449381.png "default.png")


* 错误原因    

在添加新模块的时候，模块类名 前面没有加`default`关键字，如：   

```
export class UserDetailModule { }
```

* 解决方法    

在模块类名前面加上关键字`default`：    
    
```
export default class UserDetailModule { }
```

-----------------
##  **10. TypeError: Cannot read property 'split' of undefined** 

![代码错误](https://git.oschina.net/uploads/images/2017/0724/095021_871aeab8_1449381.png "代码错误.png")

* 错误原因：  

使用split方法的元素是个undefined;

* 解决方法    

在使用split方法前，先判断元素是否为空。

-----------------

## 11. 模板语法绑定错误

![模板语法报错信息](https://git.oschina.net/uploads/images/2017/0724/094526_4838110d_1449381.png "模板语法error.png")

错误代码Html文件         
```
<div>
  <span>{{value.text}}</span>
</div>
```

ts文件     

```
public value: any;
```

正确写法：

```
<div>
  <span>{{value?.text}}</span>
</div>
```

或者

```
<div *ngIf="value">
  <span>{{value.text}}</span>
</div>
```

`？.`是angular提供的安全导航操作符，用来保护出现在属性路径中的null和undefined值    


## 12. 浏览器不识别大写地址，如`big-Data`，  

如在浏览器中输入`http://localhost:3000/#/big-Data`， Google浏览器会先把`big-data`,然后去匹配路径，    
导致angular路由 无法匹配转到了默认路径上，

所以最好不要有大写字母存在。    

## 13. Refused to display 'URL' in a frame because it set 'X-Frame-Options' to 'sameorigin'    

触发原因：页面的返回头被设置 X-Frame-Options SAMEORIGIN ，只能被同源的iframe 引用。跨域名的iframe 没法显示了。      

这个在angular中， 本地开发中webpack中配置代理， 服务器中 Nginx中配置代理即可解决问题。    


## 13. cnpm安装报错：Install fail! Error: EACCES: permission denied,      

使用速度命令安装：`sudo cnpm i`    

## 14. ng serve:Error: Cannot find module 'color-convert'   

使用npm命令安装这个缺少的包：`sudo cnpm i color-convert`