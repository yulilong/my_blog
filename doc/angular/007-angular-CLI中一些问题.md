[TOC]   

## 将ng设置成使用cnpm 

```
ng set --global packageManager=cnpm
```   

http://www.jianshu.com/p/fea407503beb?mType=Group       

-----------------------------

## **npm install 生成的package-lock.json是什么文件？有什么用？**   

```
package-lock.json is automatically generated for any operations where npm modifies either the node_modules tree, or package.json.  
It describes the exact tree that was generated, such that subsequent installs are able to generate identical trees, 
regardless of intermediate dependency updates.
大概意思好像是：package-lock.json是当 node_modules 或 package.json 发生变化时自动生成的文件。
这个文件主要功能是确定当前安装的包的依赖，以便后续重新安装的时候生成相同的依赖，而忽略项目开发过程中有些依赖已经发生的更新。
对比之下，大概是想做类似 Yarn 的功能。
详细内容，请自行查阅官方文档：https://docs.npmjs.com/files/package-lock.json

链接：https://www.zhihu.com/question/62331583/answer/197691747
```   

## 更换npm的源地址   

npm本来的源地址：   

```
npm config get registry 
https://registry.npmjs.org/
```   

更换npm的源地址:  

```
// 淘宝源
npm config set registry https://registry.npm.taobao.org  
// 自己本来的源
npm config set registry https://registry.npmjs.org/
```

参考链接：http://blog.csdn.net/v2810769/article/details/52585662