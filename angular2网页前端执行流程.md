## 示例代码版本： http://192.168.102.9/jas-paas/cloudlink-front-framework/tree/045f4811da782c107eca72f9bdea39ebaa086a7d        

----------
* 浏览器输入地址： http://localhost:3000/    

*  入口： index.html     

文件路径： cloudlink-front-framework/src/index.html      
```
# line: 27 
<body>
    <app>     这里是应用标签。程序入口
    </app>
```

文件路径： cloudlink-front-framework/src/app/app.module.ts      
```
# line: 15 
import { App } from './app.component';  # 这里加载组件，包括模板（网页html）

# line: 49 
routing # 加载路由
```    

文件路径： cloudlink-front-framework/src/app/app.component.ts        
```
# line:25
template: `
  <main [ngClass]="{'menu-collapsed': isMenuCollapsed}" baThemeRun>
      <div class="additional-bg"></div>
    <router-outlet></router-outlet>      # 这里是路由文件里面的内容，执行到这里去找路由
    </main>`,
```   

文件路径： cloudlink-front-framework/src/app/app.routing.ts      
```
# line:5
{ path: '', redirectTo: 'cloudlink', pathMatch: 'full' }, 
# 由于什么也没输入，所以默认进入这个空的
# 这里给默认的添加了一个路径 ‘cloudlink’
# 此时进入下个组件中
{ path: 'demo', redirectTo: 'demo/dashboard' },
{ path: '**', redirectTo: 'cloudlink/dashboard' }
```

文件路径： cloudlink-front-framework/src/app/core/home/home.module.ts    
```
import { routing } from './home.routing';    # 加载自己的路由
import { NgaModule } from '../../theme/nga.module';   # 加载菜单模块
import { HomeComponent } from './home.component';     # 加载组件，这里有执行，有网页，
```  

文件路径： cloudlink-front-framework/src/app/core/home/home.component.ts        
```
# line:31
template: `
    <ba-sidebar></ba-sidebar>    # 自定义标签 这里是垂直导航菜单
    # src/app/theme/components/baSidebar/baSidebar.component.ts
    # line：8 ： selector: 'ba-sidebar',
    # src/app/theme/components/baSidebar/baSidebar.html
    # line： 11 ： <menuItem [menu]='menu'></menuItem>     # 自定义标签，这里负责列表垂直菜单选项
         # src/app/theme/components/menuItem/menuItem.component.ts
         # line: 6: selector: 'menuItem',
         # src/app/theme/components/menuItem/menuItem.component.html  # 在这里从后台API查询后，列出菜单。
         
    <ba-page-top></ba-page-top>   #自定义标签 这里是网页顶部header菜单，如退出按钮菜单
    # src/app/theme/components/baPageTop/baPageTop.component.ts
    # line:8 : selector: 'ba-page-top',
    
    <div class="al-main">
      <div class="al-content"> 
        <router-outlet></router-outlet>      # 这里加载路由
      </div>
    </div>
    <ba-back-top position="200"></ba-back-top>
    `
```