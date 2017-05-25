## 示例代码版本： http://192.168.102.9/jas-paas/cloudlink-front-framework/tree/045f4811da782c107eca72f9bdea39ebaa086a7d        

----------

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