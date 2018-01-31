## VUE组件模板中只能有一个根元素：Component template should contain exactly one root element   

![](https://bitbucket.org/repo/oE6yEX/images/3080881738-WX20180131-111247@2x.png)     

报错的信息：  
```
(Emitted value instead of an instance of Error) 
  Error compiling template:
  <div class="header">
  </div>
  <div>
    找回密码
  </div>
  
  - Component template should contain exactly one root element. If you are using v-if on multiple elements, use v-else-if to chain them instead.

 @ ./src/views/view-reset/ViewReset.vue 11:0-371
 @ ./src/router/index.js
```   

错误的原因是一个VUE组件的模板中只能有一个根元素，不能出现多个元素，正确的写法：   
```
<template>
  <div>
    <div class="header">
      我是头部导航栏
    </div>
  </div>

</template>
```