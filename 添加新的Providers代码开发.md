# 添加一个新的providers代码目录 #


## 添加页面validate按钮可用设置 ##

manageiq/app/assets/javascripts/controllers/ems_common/ems_common_form_controller.js  


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