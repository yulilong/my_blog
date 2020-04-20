## 1. IE盒模型和标准盒模型

![](./../../asset/img/001-box-sizing.png)

可使用CSS属性来切换IE盒模型和标准盒模型：

```CSS
box-sizing:border-box || content-box || inherit
```

- 当使用content-box时：页面将采用标准模式来解析计算，content-box也是默认模式
- 当使用border-box时，页面将采用怪异模式解析计算，怪异模式也称为IE模式
- 当使用inherit时：页面将从父元素继承box-sizing的值

参考资料：https://www.jianshu.com/p/cc2bc404269b