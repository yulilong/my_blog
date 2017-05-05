### 根据认证状态来查询数据      

`![WX20170411-170727.png](https://bitbucket.org/repo/oE6yEX/images/253475548-WX20170411-170727.png)`      

如上图所示。    

* **上图 1 部分代码：**    

src/app/jasframework/admin-center/privilege-admin/enterprise-admin/enterprise-list/enterprise-list-show/enterprise-list-show.component.html        
```
<div class="init">
        <span>认证状态： </span>
        <span><a class="status" (click)="searchStatus('')">全部状态</a></span>
        <!--<span><a href="" class="status">全部状态</a></span>-->
        <span><a class="status" (click)="searchStatus(0)">未认证</a></span>
        <span><a class="status" (click)="searchStatus(1)">认证通过</a></span>
        <span><a class="status" (click)="searchStatus(-1)">认证驳回</a></span>
        <span><a class="status" (click)="searchStatus(2)">等待认证</a></span>
    </div>
```     
src/app/jasframework/admin-center/privilege-admin/enterprise-admin/enterprise-list/enterprise-list-show/enterprise-list-show.component.ts      
```
public searchStatus(status) {
    let pageNum = 1;
    let pageSize = 10;
    this.enterpriseAdminService.listMes(pageNum, pageSize, status)
      .then(
      datas => {
        this.datas = datas["rows"];
        this.statusPipe(this.datas);
        this.totalItems = datas["totalElements"];
      })
  }
```      
src/app/jasframework/admin-center/privilege-admin/enterprise-admin/enterprise-list/enterprise-list-show/enterprise-list-show.component.css      
```
div.init {
        margin-bottom: 25px;
    }
    
    .init a.status {
        padding: 5px 15px;
        /*background: #ccc;*/
        background: #09e837;
        cursor: pointer;
        color: #ff0000;
        margin-right: 5px;
    }
    
    .init a.status:hover {
        color: #000000;
        background: #b4adad;
    }
```

* **上图2 的代码：**     
src/app/jasframework/admin-center/privilege-admin/enterprise-admin/enterprise-list/enterprise-list-show/enterprise-list-show.component.html        
```     
# 组件文档： https://www.primefaces.org/primeng/#/datatable  
<p-dataTable class="dataTable" [value]="datas" selectionMode="single" [(selection)]="selectedEnterprise">
        <!--<p-column [style]="{'width':'38px'}" selectionMode="multiple"></p-column>-->
        <p-column field="enterpriseName" header="企业名称"></p-column>
        <p-column field="enterpriseScale" header="企业规模"></p-column>
        <p-column field="registerNum" header="企业注册号"></p-column>
        <p-column field="telephoneNum" header="联系电话"><a>123</a></p-column>
        <p-column field="authenticateStatus" header="认证状态"></p-column>
        <p-column field="authenticateStatus" header="操作">
            <template let-col let-opt="rowData" pTemplate="body">
              <span><a class="set" (click)="open()" >管理</a></span>
              <span><a class="set">冻结</a></span>
              <span *ngIf="opt[col.field] == '未认证' || opt[col.field] == '认证驳回'" ><a class="set">审查</a></span>
            </template>
        </p-column>
    </p-dataTable
```    
src/app/jasframework/admin-center/privilege-admin/enterprise-admin/enterprise-list/enterprise-list-show/enterprise-list-show.component.css        
```
.dataTable a.set {
        /*padding: 5px 15px;*/
        /*background: #a0eca0;*/
        cursor: pointer;
        color: #005ff7;
        margin-right: 5px;
    }
    
    .dataTable a.set:hover {
        color: #000000;
        /*background: #b4adad;*/
    }
```    
p-dataTable 插件地址信息：       
https://www.primefaces.org/primeng/#/datatable    

### API 网关地址 配置    

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

### 服务跟模块注册使用   

![WX20170505-102149.png](https://bitbucket.org/repo/oE6yEX/images/2378097808-WX20170505-102149.png)   

如上图所示，先有一个模型跟服务，需要在`enterprise-auth/enterprise-authed-approve`里面使用：    
模型使用：   
```
# enterprise-admin/enterprise-auth/enterprise-authed-approve/enterprise-authed-approve.component.ts 
# 只需要在这个文件中写如下代码即可：
import {EnterpriseAdminModel} from "../shared/enterprise-admin.model";
```  
服务的使用：    
```
# 方法一：
# enterprise-admin/enterprise-auth/enterprise-authed-approve/enterprise-authed-approve.component.ts 
在文件中写入如下代码：
import {EnterpriseAdminService} from "../shared/enterprise-admin.service";

@Component({
    selector: "jas-enterprise-authed-approve",
    templateUrl: "./enterprise-authed-approve.component.html",
    styleUrls: ["./enterprise-authed-approve.component.css"],
    providers:[EnterpriseAdminService]
})

方法二：   
# enterprise-auth/enterprise-authed-approve/enterprise-authed-approve.component.ts 
# 在文件中写入如下代码：
import {EnterpriseAdminService} from "../shared/enterprise-admin.service";  # 引入使用

# enterprise-auth/enterprise-auth.module.ts 
# 在文件中写入如下代码：
import { EnterpriseAdminService } from './shared/enterprise-admin.service';

@NgModule({
    imports: [
    ],
    declarations: [
    ],
    bootstrap: [    ],
    providers:[EnterpriseAdminService    ]  # 引入声明
})
```