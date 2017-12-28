[TOC]

## angular中引入jQuery

### 1. 安装jQuery插件   

```
~ npm i jquery
cloudlink-front-framework@0.1.0 /Users/yulilong/work/cloudlink-front-framework
├── UNMET PEER DEPENDENCY @angular/common@2.4.6
├── UNMET PEER DEPENDENCY @angular/compiler@2.4.6
├── UNMET PEER DEPENDENCY @angular/compiler-cli@>=2.1.x
├── UNMET PEER DEPENDENCY @angular/core@2.4.6
├── UNMET PEER DEPENDENCY @angular/forms@2.4.6
├── jquery@2.2.4
└── UNMET PEER DEPENDENCY rxjs@5.0.0-beta.12
```    

### 2. 在index.html中引用jquery    

src/index.html     
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <script src="../node_modules/jquery/dist/jquery.min.js"></script>      # 在这里引入jQuery
    <base href="<%= htmlWebpackPlugin.options.metadata.baseUrl %>">
</head>
```     

### 3. 在组件app.component.ts中添加jQuery功能    

src/app/jasframework/enterprise-admin/app-enterprise/enterprise-list/enterprise-list-show-view/enterprise-list-show-view.component.ts       
```
import { EnterpriseAppInfo } from './../../shared/app-enterprise.model';
declare var $:any;
@Component({
  selector: 'enterprise-list-show',
  templateUrl: './enterprise-list-show-view.component.html',
  styleUrls: ['./enterprise-list-show-view.component.css'],
})

export class EnterpriseListShowViewComponent implements OnInit {
   ngOnInit() {
    $(".title11").html("<p>这是JQUERY插件设置</p>");
   }
}
```   
首先需要使用declare生命我们的jQuery，使之成为一个可用的变量，然后，我们需要导入OnInit模块并实现，我们编写的jquery代码就在这里，问中展示了我们向id为title的标签替换内容，HTML页面是这样的:     

src/app/jasframework/enterprise-admin/app-enterprise/enterprise-list/enterprise-list-show-view/enterprise-list-show-view.component.html        
```
<div id="title" class="title11"></div>
```   

###  4. 参考链接    

http://www.jb51.net/article/105123.htm      


-----------  

## angular2中引入 easyui   

### 1. 参考链接   

angular中引入easyUI教程： http://jeasyui.com/download/a07.php     
angular中使用easyUI教程： http://www.jeasyui.com/demo-angular/main/index.php?sort=desc    
EasyUI for Angular 简评： http://www.zisuzz.com/topic/29/easyui-for-angular-简评

### 2. 引入easyUI   

1. 下载easyUIangular组件： http://jeasyui.com/download/downloads/angular-easyui-0.7.zip     
2. 解压后把`components`文件复制到用的文件中。    
3. 把`themes`文件放到asset文件夹下，
4. 在index文件中引入样式：   

```
<link rel="stylesheet" type="text/css" href="assets/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="assets/themes/angular.css">
<link rel="stylesheet" type="text/css" href="assets/themes/icon.css">
```

或者直接在组件样式(app.component.css )中引入：  

```
@import 'easyui/themes/material/easyui.css';
@import 'easyui/themes/angular.css';
@import 'easyui/themes/icon.css';
```   

## 引入ngx-img: 图片上传插件

npm网站地址：https://www.npmjs.com/package/ngx-img      
源码地址：   https://github.com/harryy2510/ngx-img      
demo展示地址：https://harryy2510.github.io/ngx-img/home    

### 1. 安装使用 

```
// 安装
npm install --save ngx-img    

// 如果是在根模块中引入
import { NgxImgModule } from 'ngx-img';
 
@NgModule({
  declarations: [AppComponent, ...],
  imports: [NgxImgModule.forRoot(), ...],  
  bootstrap: [AppComponent]
})
export class AppModule {
}

// 不在根模块，在其他模块引入
import { NgxImgModule } from 'ngx-img';
 
@NgModule({
  declarations: [OtherComponent, ...],
  imports: [NgxImgModule, ...], 
})
export class OtherModule {
}

// 使用方法看demo ：https://harryy2510.github.io/ngx-img/home

```   

### 2. 直接把源码模块复制到自己的项目中去    

如果第一种方法报错，那么说明使用npm安装使用不适用你（本人就是失败），那么可以去github源码上把这个模块复制到自己的项目下。     
https://github.com/harryy2510/ngx-img/blob/master/src/module/ngx-img.module.ts     
目前项目源码是上面链接的模块，`git clone` 项目后，把这个模块复制到自己项目中，引入模块，写上示例代码，然后运行。   
此时会报错，以为缺少一个包`cropperjs`，使用`npm install cropperjs --save`安装后，即可成功使用。