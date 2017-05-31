### 常用命令    

```
~ npm install express         # 安装express到项目中，安装的是最新版本
~ npm install express@3.0.6   # 安装express的3.0.6版本，  安装特定版本
~ npm install <name> -g       # 将包安装到全局环境中
~ npm install lodash --save   # save 在package.json文件的dependencies字段添加该package的名称和版本号
~ npm i <name> -g             # 将包安装到全局环境中 i 是 install 的缩写，如果用i失败，则用install试试
~ npm init                    # 会引导你创建一个package.json文件，包括名称、版本、作者这些信息等
~ npm remove <name>           # 移除
~ npm uninstall lodash        # 卸载lodash
~ npm uninstall --save lodash # save 卸载的同时想把这个package包的信息从package.json文件的dependencies字段中也一并删除
~ npm update <name>           # 更新
~ npm root                    # 查看当前包的安装路径       
~ npm ls                      # 列出当前安装的了所有包
~ npm root                    # 查看当前包的安装路径
~ npm help                    # 帮助，如果要单独查看install命令的帮助，可以使用的npm help install

```

---------

### npm install 安装原理      

npm install 命令用来安装模块到node_modules目录。     
安装之前，npm install会先检查，node_modules目录之中是否已经存在指定模块。如果存在，就不再重新安装了，即使远程仓库已经有了一个新版本，也是如此。          
如果你希望，一个模块不管是否安装过，npm 都要强制重新安装，可以使用-f或--force参数。
```
$ npm install <packageName> --force
```     

### npm update     

如果想更新已安装模块，就要用到npm update命令。       
```
$ npm update <packageName> 
```
它会先到远程仓库查询最新版本，然后查询本地版本。如果本地版本不存在，或者远程版本较新，就会安装。      

### registry     

npm update命令怎么知道每个模块的最新版本呢？        
答案是 npm 模块仓库提供了一个查询服务，叫做 registry 。以 npmjs.org 为例，它的查询服务网址是 :      
https://registry.npmjs.org/        
这个网址后面跟上模块名，就会得到一个 JSON 对象，里面是该模块所有版本的信息。比如，访问https://registry.npmjs.org/react ，就会看到 react 模块所有版本的信息。         
它跟下面命令的效果是一样的。      
```
$ npm view react
# npm view 的别名
$ npm info react
$ npm show react
$ npm v react
```
registry 网址的模块名后面，还可以跟上版本号或者标签，用来查询某个具体版本的信息。比如， 访问 https://registry.npmjs.org/react/v0.14.6 ，就可以看到 React 的 0.14.6 版。      


### 参考链接     

http://blog.csdn.net/haidaochen/article/details/8546796/       
http://www.nodeclass.com/articles/810142     
http://www.cnblogs.com/jiuyi/p/5353676.html