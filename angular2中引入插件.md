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