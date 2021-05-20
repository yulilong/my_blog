[TOC]



# node运行环境常见问题

## 1. node环境不支持ES6的import解决

在我学习ES6的import语法的时候，在自己电脑的node环境下模拟运行import，发现node环境不支持import语法，报如下错误：

```bash
(function (exports, require, module, __filename, __dirname) { import pp from './a'
                                                              ^^^^^^
SyntaxError: Unexpected token import
    at createScript (vm.js:80:10)
    at Object.runInThisContext (vm.js:139:10)
    at Module._compile (module.js:617:28)
    at Object.Module._extensions..js (module.js:664:10)
    at Module.load (module.js:566:32)
    at tryModuleLoad (module.js:506:12)
```

我的node版本是`v8.12.0`, 

在网络上查找资料发现：nodejs采用的是CommonJS的模块化规范，使用require引入模块；而import是ES6的模块化规范关键字。想要使用import，必须引入babel转义支持，通过babel进行编译，使其变成node的模块化代码。

由于我只是学习测试，不想这么麻烦，所以我发现了一个快捷的测试方法：

可以使用`--experimental-modules`实验模块标志来启用加载ECMAScript Modules的特性。
而且作为ES模块加载的文件名，必须以`.mjs`后缀结尾

```bash
node --experimental-modules my-app.mjs

# 此种方法，在输出的时候会出现如下提示，表示是个实验模块，到时候可能会修改。
(node:16208) ExperimentalWarning: The ESM module loader is experimental.
```

经过我的测试，这个`node --experimental-modules`是可以的，只不过测试文件后缀名要修改成`.mjs`

参考资料: https://www.cnblogs.com/weiqinl/p/9152219.html

## 2. node版本太高，导致gitbook报错

2021-04-04

由于使用新电脑，初次安装node后，再安装好gitbook-cli工具后，再命令行中执行gitbook命令报错：

```bash
gitbook build .
/usr/local/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287
      if (cb) cb.apply(this, arguments)
                 ^

TypeError: cb.apply is not a function
    at /usr/local/lib/node_modules/gitbook-cli/node_modules/npm/node_modules/graceful-fs/polyfills.js:287:18
    at FSReqCallback.oncomplete (fs.js:184:5)
```

经过搜索，看到一个相关解决文档：https://blog.csdn.net/weixin_42349568/article/details/108414441

发现这个是由于node版本太高导致。

我的node版本：

```bash
node -v
v14.16.0
```

需要使用n工具来切换工具：

```bash
npm install -g n
sudo n v10.21.0
```

经过把node版本切换到`v10.21.0`后，在执行gitbook命令发现没有问题了，问题得到解决。







