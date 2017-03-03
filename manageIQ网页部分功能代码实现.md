* **代码版本**   
https://github.com/ManageIQ/manageiq/tree/euwe-1       
-----

* **创建一个虚拟机实例(instance)** 

1.网页链接： http://localhost:3000/vm_cloud/explorer    
2.当输入信息后，点击 “submit”后，controller部分处理代码位置：   manageiq/app/controllers/application_controller/miq_request_methods.rb     
```
elsif params[:button] == "submit" # Update or create the request from the workflow with the new options
   prov_req_submit                # line:208
else
```