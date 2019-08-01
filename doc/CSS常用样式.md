[TOC]    

## 垂直水平居中      

### 行内元素       
水平居中：在父元素样式中加入`text-align: center;`，即可。       
垂直居中：只有一行，可在行内元素中加入`vertical-align: middle;`(只对行内元素生效)，即可实现垂直居中
垂直水平居中可根据上面的方法实现：  
```
// HTML
<div class="box">
 <img class="center" src="http://cdn.jirengu.com/public/logo-tiny.png" alt="">
 <!-- <span class="center">1111111</span> -->
</div>

// CSS
.box{ width: 300px; height: 200px; border: 1px solid ; text-align: center; }
.box:before{
  content: '';
  border: 1px solid green;
  display: inline-block;
  height: 100%;
  vertical-align: middle;
}
.box .center{
  vertical-align: middle;  // 如果行内元素只有文字，那么这个样式可忽略，其他要加这个样式
  background: blue;
}
```

### 块元素   
块元素变成行内块元素 及可用行内元素方法实现垂直水平居中。

块元素水平居中： 设置宽度，然后设置`margin: 0 auto` 来实现水平居中。