## **代码版本**   
https://github.com/ManageIQ/manageiq/tree/euwe-1       
-----

## **创建一个虚拟机实例(instance)** 

1.网页链接： http://localhost:3000/vm_cloud/explorer    
2.当输入信息后，点击 “submit”后，controller部分处理代码位置：   manageiq/app/controllers/application_controller/miq_request_methods.rb     
```
elsif params[:button] == "submit" # Update or create the request from the workflow with the new options
   prov_req_submit                # line:208
else
```      

##登录后网页效果显示的代码    

1.在每个网页显示效果是， Rails会指定一个默认的页面模板，这个模板位置：          
[app/views/layouts/application.html.haml](https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/layouts/application.html.haml)       
这个模板里定义了网页的风格与导航栏的定义。
在这个文件里：    
4~12行，18~48行是网页的 head部分(登录网页后右键查看元素)。      
13~14，50~53行， 是网页的body部分，