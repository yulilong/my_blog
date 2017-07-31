**目录**  

[TOC]

## API 网关地址 配置    

cloudlink-front-framework/config/webpack.dev.js    
```
# line 13 ~ 19
/**
 * Webpack Constants 
 */
const ENV = process.env.ENV = process.env.NODE_ENV = 'development';
const HOST = process.env.HOST || 'localhost';
const PORT = process.env.PORT || 3000;
const HMR = helpers.hasProcessFlag('hot');

# line 150 ~ 171
devServer: {
            port: METADATA.port,
            host: METADATA.host,
            historyApiFallback: {
                index: '/index.html'
            },
            watchOptions: {
                aggregateTimeout: 300,
                poll: 1000
            },
            proxy: {
                '/cloudlink/v1/**': {
                    target: 'http://192.168.100.90:8050',
                    // target: 'http://192.168.120.110:8050',

                    // target: 'http://192.168.20.221:8901', //赵杨 ip
                    // target: 'http://192.168.100.212:8050',
                    secure: false,
                    pathRewrite: { '^/cloudlink/v1': '' }
                }
            }
        },
```   

------
## 服务注册使用   

![WX20170505-102149.png](https://bitbucket.org/repo/oE6yEX/images/2378097808-WX20170505-102149.png)   

如上图所示，先有一个模型跟服务，需要在`enterprise-auth/enterprise-authed-approve`里面使用：    
**模型使用：**   
```
# enterprise-admin/enterprise-auth/enterprise-authed-approve/enterprise-authed-approve.component.ts 
# 只需要在这个文件中写如下代码即可：
import {EnterpriseAdminModel} from "../shared/enterprise-admin.model";
```  
**服务的使用：**    
```
# 服务的依赖注入： https://angular.cn/docs/ts/latest/guide/dependency-injection.html
# 方法一： 直接在组件中引入使用
# enterprise-admin/enterprise-auth/enterprise-authed-approve/enterprise-authed-approve.component.ts 
# 在文件中写入如下代码：
import {EnterpriseAdminService} from "../shared/enterprise-admin.service"; # 导入服务文件

@Component({
    selector: "jas-enterprise-authed-approve",
    templateUrl: "./enterprise-authed-approve.component.html",
    styleUrls: ["./enterprise-authed-approve.component.css"],
    providers:[EnterpriseAdminService]                               # 在这里写上服务名字
})
------------------------------------------------------------------------------------------

# 方法二： 在组件的所在的模块中注册服务后，在组件中直接使用
# enterprise-auth/enterprise-auth.module.ts 
# 在文件中写入如下代码：
import { EnterpriseAdminService } from './shared/enterprise-admin.service';
@NgModule({
    imports: [
    ],
    declarations: [
    ],
    providers:[EnterpriseAdminService    ]  # 引入声明
})

# enterprise-auth/enterprise-authed-approve/enterprise-authed-approve.component.ts 
# 在文件中写入如下代码：
import {EnterpriseAdminService} from "../shared/enterprise-admin.service";  # 引入使用

------------------------------------------------------------------------------------------
# 方法三：在组件的所在的模块中为服务申明一个名字，在子模块中直接用这个名字调用
# enterprise-auth/enterprise-auth.module.ts 
# 在文件中写入如下代码：
mport { EnterpriseAdminService } from './shared/enterprise-admin.service';
@NgModule({
    providers:[
       {provide:'view',useClass:EnterpriseAdminService} # 引入声明
    ]  
})

# enterprise-auth/enterprise-authed-approve/enterprise-authed-approve.component.ts 
# 在构造函数中直接引用：
constructor(@Inject('view') private viewService,

```     

---------------
## 模块组件注册使用      

![WX20170526-135439.png](https://bitbucket.org/repo/oE6yEX/images/3381880586-WX20170526-135439.png)     

如上图所示，模块`charts`需要在`enterprise-admin`下注册使用：      
```
# 模块的注册使用 

# src/app/jasframework/enterprise-admin/charts/charts.module.ts 
import {Charts} from './charts.component';
import {ChartsRoutes} from './charts.routing'
import {NgModule}      from '@angular/core';
import {CommonModule} from '@angular/common';
@NgModule({
  imports: [CommonModule, ChartsRoutes],
  declarations: [Charts],
  bootstrap: [Charts]
})
export default class ChartsModule {
}

# src/app/jasframework/enterprise-admin/charts/charts.routing.ts
import {Routes, RouterModule} from '@angular/router';
import {Charts} from './charts.component';
const routes:Routes = [
  {
    path: '',
    component: Charts,
    children: [ ]
  },
];
export const ChartsRoutes = RouterModule.forChild(routes);

# src/app/jasframework/enterprise-admin/charts/charts.component.ts
import {Component, OnInit} from '@angular/core';
@Component({
  selector: 'charts',
  templateUrl: 'charts.component.html',
  providers: [ ]
})
export class Charts implements OnInit {
  constructor() { }
  ngOnInit() { }
} 

# src/app/jasframework/enterprise-admin/charts/charts.component.html
<div>hello charts</div>

# 注册模块使之生效   
# 只需要在enterprise-admin的路由文件中注册这个路径就可以了
# src/app/jasframework/enterprise-admin/enterprise-admin.routing.ts
const routes: Routes = [
    {
        path: '', 
        component: EnterpriseAdminComponent,
        children:[{
              path: 'charts',   # 这里是路径
              loadChildren: ()=>System.import('./charts/charts.module.ts'), # 指导去哪里找这个模块
          }]
    },
];
```     

模块比组件多了xx.module.ts与xx.routing.ts两个文件。如果删除这2个文件，那么就是组件。
组件的加载使用：   
```
# 还是以charts为例，代码在上面，少了xx.module.ts与xx.routing.ts两个文件。

# 注册组件使之生效   
# 需要在enterprise-admin的路由文件中注册这个路径，在模块中也需要声明
# src/app/jasframework/enterprise-admin/enterprise-admin.routing.ts
import {Charts} from './charts/charts.component';  # 引入这个组件
const routes: Routes = [
    {
        path: '', 
        component: EnterpriseAdminComponent,
        children:[{
              path: 'charts',   # 这里是路径
              component: Charts, # 指明组件
          }]
    },
];

# src/app/jasframework/enterprise-admin/enterprise-admin.module.ts
import {Charts} from './charts/charts.component'; # 引入这个组件
@NgModule({
    imports:      [ CommonModule,EnterpriseAdminRoutes ],
    declarations: [ EnterpriseAdminComponent, Charts ],   # 在这里写入Charts,这里是声明
    bootstrap:    [ EnterpriseAdminComponent ]
})
```