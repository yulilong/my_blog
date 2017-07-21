### **1、开发环境下 `npm install` 编译进行一半就停止**    

![WX20170407-092321.png](https://bitbucket.org/repo/oE6yEX/images/3794077934-WX20170407-092321.png)    

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

### 2、__WEBPACK_EXTERNAL_MODULE_XX__ is not defined

解决方法：      
```
# https://stackoverflow.com/questions/39103483/uncaught-referenceerror-webpack-external-module-xx-is-not-defined/39105605#39105605

# The solution was to set libraryTarget: 'amd' in the webpack.config.js file like so:
output: {
    filename: 'dist/[name].bundle.js',
    libraryTarget: 'amd'
},
```     

---------
###  3、Angular2管理外部类型定义和处理“Duplicate identifier” TypeScript错误      

https://segmentfault.com/a/1190000007560996    

-----------
### *4、*Module build failed: TypeError: Cannot read property 'exclude' of undefined**     

![WX20170619-142138.png](https://bitbucket.org/repo/oE6yEX/images/4073388751-WX20170619-142138.png)      

这个错误是由于`awesome-typescript-loader` package导致的，解决方法：    
编辑文件`~/node_modules/awesome-typescript-loader/dist/instance.js`: 
```
# https://github.com/s-panferov/awesome-typescript-loader/issues/293
# 大约是142行
# 替换applyDefaults 函数体内容：
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
# 从新运行命令 npm start即可解决问题
```   

--------------

## **5、Node Sass does not yet support your current environment: OS X 64-bit with Unsupported runtime**   

![WX20170721-174654.png](https://bitbucket.org/repo/oE6yEX/images/3606234759-WX20170721-174654.png)   

```
# 根据链接：https://github.com/sass/node-sass/releases/tag/v3.13.1
可知道是node版本太高了，卸载node后，下载低版本的node即可解决问题
```    

## **6、Node Sass could not find a binding for your current environment: OS X 64-bit with Node.js 6.x**

![WX20170721-174928.png](https://bitbucket.org/repo/oE6yEX/images/294361940-WX20170721-174928.png)   

根据提示即可解决问题。    


----------