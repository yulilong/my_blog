* **代码版本**   
https://github.com/ManageIQ/manageiq/tree/euwe-1       
-----    

* **I18自动转化成网页当前语言的包**


* **汉化的文件**     

manageiq/locale/zh_CN/manageiq.po       
manageiq/app/assets/javascripts/locale/zh_CN/app.js      


## dashboard 页面标题的汉化      

1. 网址： 
http://localhost:3000/dashboard/show     

2. controller处理信息     
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/controllers/dashboard_controller.rb#L88      
这里面对数据进行处理后，view调用默认的show页面对数据进行渲染。      

3. app/views/dashboard/show.html.haml 网页渲染。