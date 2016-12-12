# 添加一个新的providers代码目录 #


## 添加页面validate按钮可用设置 ##

manageiq/app/assets/javascripts/controllers/ems_common/ems_common_form_controller.js  

在191行 附近如下代码处添加一行代码（$scope.emsCommonModel.emstype == "aliyun" ||）  
```
#!js

$scope.isBasicInfoValid = function() {
    if(($scope.currentTab == "default" && $scope.emsCommonModel.emstype != "azure") &&
      ($scope.emsCommonModel.emstype == "ec2" ||
      $scope.emsCommonModel.emstype == "aliyun" ||
       $scope.emsCommonModel.emstype == "openstack" && $scope.emsCommonModel.default_hostname ||
       $scope.emsCommonModel.emstype == "scvmm" && $scope.emsCommonModel.default_hostname ||
       $scope.emsCommonModel.emstype == "openstack_infra" && $scope.emsCommonModel.default_hostname ||
       $scope.emsCommonModel.emstype == "nuage_network"  && $scope.emsCommonModel.default_hostname ||
       $scope.emsCommonModel.emstype == "rhevm" && $scope.emsCommonModel.default_hostname ||
       $scope.emsCommonModel.emstype == "vmwarews" && $scope.emsCommonModel.default_hostname
```


# 添加work #

## EVM启用监听 ##  

### ManageIQ/manageiq/config/settings.yml  

https://github.com/ManageIQ/manageiq/blob/euwe-1-rc2/config/settings.yml#L1258  
在这个配置文件里面添加：   
:ems_metrics_collector_worker_aliyun: {}  
![ems_metrics_collector_woker_aliyun.png](https://bitbucket.org/repo/oE6yEX/images/2240284131-ems_metrics_collector_woker_aliyun.png)  

https://github.com/ManageIQ/manageiq/blob/euwe-1-rc2/config/settings.yml#L1295  
添加如下代码：   
:ems_refresh_worker_aliyun: {}  
![ems_refresh_worker_aliyun.png](https://bitbucket.org/repo/oE6yEX/images/96709230-ems_refresh_worker_aliyun.png)  

### manageiq/app/models/miq_server/worker_management/monitor/class_names.rb  

添加代码：  
ManageIQ::Providers::Aliyun::CloudManager::MetricsCollectorWorker      
ManageIQ::Providers::Aliyun::CloudManager::RefreshWorker     
![monitor_class_names.png](https://bitbucket.org/repo/oE6yEX/images/2637574744-monitor_class_names.png)  

![monitor_class_names_in_kill_order.png](https://bitbucket.org/repo/oE6yEX/images/1078881447-monitor_class_names_in_kill_order.png)   


## providers中添加代码 ## 

可以参考其他providers，需要添加如下几个文件：   
manageiq-providers-aliyun/app/models/manageiq/providers/aliyun/cloud_manager/metrics_collector_worker/runner.rb     

manageiq-providers-aliyun/app/models/manageiq/providers/aliyun/cloud_manager/metrics_collector_worker.rb    

manageiq-providers-aliyun/app/models/manageiq/providers/aliyun/cloud_manager/refresh_worker.rb   

manageiq-providers-aliyun/app/models/manageiq/providers/aliyun/cloud_manager/refresher.rb

![aliyun_dirctory.png](https://bitbucket.org/repo/oE6yEX/images/1161947007-aliyun_dirctory.png)    

--------------------------------------------------------------------------------------------------------------  
## aliyun providers 中读取套餐(Flavors) ##

### 在显示套餐详细信息页面中添加aliyun providers 图标 (http://localhost:3000/flavor/show/15)###

图标存放位置：   
manageiq/app/assets/images/100   

图片名字：  
vendor-aliyun.png   

