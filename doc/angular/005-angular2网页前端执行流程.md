## 示例代码版本： http://192.168.102.9/jas-paas/cloudlink-front-framework/tree/045f4811da782c107eca72f9bdea39ebaa086a7d        

-----------

## 命令行运行命令启动服务    

1. 在开发环境下，打开项目目录，运行命令`npm start`, 
2. 这个命令会进入`package.json`文件中：    
```
# package.json
"scripts": {
  "start": "npm run server:dev",   # 这个就是 npm start 命令执行的脚本，这个脚本指向了下面的脚本
  "server:dev": "webpack-dev-server --config config/webpack.dev.js --progress --profile --watch --content-base src/",
  # 这里最终是执行了webpack的打包
}
```

3. webpack的执行顺序：    
```
# angular2官方网站关于webpack的介绍文档
# https://angular.cn/docs/ts/latest/guide/webpack.html

# 首先进入./webpack.config.js文件里面，
case 'dev':
  case 'development':
  default:
    module.exports = require('./config/webpack.dev')({env: 'development'}); # 开发环境，进入这个文件路径

# config/webpack.dev.js
# 在这个文件中还有打包好多输入文件路径以及规则，还有启动后的网址端口，链接的API地址
const commonConfig = require('./webpack.common.js');   # 这个文件引入了打包的文件入口
const ENV = process.env.ENV = process.env.NODE_ENV = 'development';
const HOST = process.env.HOST || 'localhost';   # 访问地址
const PORT = process.env.PORT || 3000;          # 访问端口号
# 开发环境下的API链接设置
proxy: {
        '/cloudlink/v1/**': {
          target: 'http://192.168.100.90:8050',: false,
          pathRewrite: { '^/cloudlink/v1': '' }
        }
      }


# config/webpack.common.js  在这里，有打包文件的入口以及一些规则，想要知道什么意思看angular2官方网站关于webpack的介绍。
entry: {
  'polyfills': './src/polyfills.browser.ts',
  'vendor': './src/vendor.browser.ts',
  'main': './src/main.browser.ts'                 # 这里就是程序的入口
        },
```
----------

----------

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
import { routing } from './home.routing';             # 加载自己的路由
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

文件路径： src/app/core/home/home.routing.ts     
```
# line:6
const routes: Routes = [
  {
    path: 'login',
    loadChildren: () => System.import('../login/login.module')             # 这里是登录
  },
  {
    path: 'register',
    loadChildren: () => System.import('../register/register.module')
  },
  {
    path: 'cloudlink',   # 匹配这里
    component: HomeComponent,
    children: [
      { path: '', redirectTo: 'dashboard', pathMatch: 'full' },         # 这里匹配空，并且加上了‘dashboard’
      { path: 'jas', loadChildren: () => System.import('../../jasframework/jas/jas.module.ts'), canLoad: [AuthGuard] },
      { path: 'dashboard', loadChildren: () => System.import('../dashboard/dashboard.module'), canLoad: [AuthGuard] },
```    
文件路径： src/app/core/dashboard/dashboard.module.ts         
文件路径： src/app/core/dashboard/dashboard.component.ts         
文件路径： src/app/core/dashboard/dashboard.html               
这里没有什么，正常显示。