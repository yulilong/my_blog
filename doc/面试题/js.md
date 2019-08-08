[TOC]

## 1. 浏览器输入url到页面最后呈现 有哪些过程？

1. 用户输入URL地址
2. 浏览器解析URL解析出主机名
3. 浏览器将主机名转换成服务器ip地址（浏览器先查找本地DNS缓存列表 没有的话 再向浏览器默认的DNS服务器发送查询请求 同时缓存）
4. 浏览器将端口号从URL中解析出来
5. 浏览器建立一条与目标Web服务器的TCP连接（三次握手）
6. 浏览器向服务器发送一条HTTP请求报文
7. 服务器向浏览器返回一条HTTP响应报文
8. 关闭连接 浏览器解析文档
9. 如果文档中有资源 重复6 7 8 动作 直至资源全部加载完毕

## 2. 浏览器渲染页面流程

1. 解析HTML生成DOM树。
2. 解析CSS生成CSSOM规则树。
3. 将DOM树与CSSOM规则树合并在一起生成渲染树。
4. 遍历渲染树开始布局，计算每个节点的位置大小信息。
5. 将渲染树每个节点绘制到屏幕。

https://segmentfault.com/a/1190000010298038

https://juejin.im/post/5a8e242c5188257a6b060000

## 3. ES6新特性

https://fangyinghang.com/es-6-tutorials/

1、作用域：块级作用域、let、const：

块作用域：

```js
var a = 1;
{
	var a = 3;
}
console.log(a)	// 1
```

2、箭头函数

- `sum = (a, b) => a + b`
- `nums.forEach( v => { console.log(v) })`
- 词法 this

3、参数处理

默认参数值

```js
function multiply(a, b = 1) {
  return a * b;
}
```

剩余参数：允许我们将一个不定数量的参数表示为一个数组

```js
function sum(...theArgs) {
  return theArgs.reduce((previous, current) => {
    return previous + current;
  });
}
console.log(sum(1, 2, 3));
// expected output: 6
```

展开运算符：将数组表达式或者string在语法层面展开

```js
function sum(x, y, z) {
  return x + y + z;
}
const numbers = [1, 2, 3];
console.log(sum(...numbers));
// expected output: 6
```



4、模板字面量

[多行字符串](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/template_strings#多行字符串)

```
console.log(`string text line 1
string text line 2`);
```

[插入表达式](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/template_strings#插入表达式)

```js
var a = 5;
var b = 10;
console.log('Fifteen is ' + (a + b) + ' and\nnot ' + (2 * a + b) + '.');
// "Fifteen is 15 and
// not 20."
```

