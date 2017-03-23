* **代码版本**   
https://github.com/ManageIQ/manageiq/tree/euwe-1       
-----    

* **I18自动转化成网页当前语言的包**
rails I18n 资料： http://guides.ruby-china.org/i18n.html        

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

```
# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/show.html.haml#L8 
# 这一行显示数据接着处理，此时跳到另个文件里继续执行程序
= WidgetPresenter.new(self, controller, widget).render_partial   
```    

4. app/presenters/widget_presenter.rb 对 render_partial 方法进行处理    
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/presenters/widget_presenter.rb#L19      

```
def render_partial
    @controller.render_to_string(:template => 'dashboard/_widget', :handler => [:haml], 
                                 :layout => false, :locals => {:presenter => self}).html_safe
end
# :template => 'dashboard/_widget', :handler => [:haml], 
# 这里是调用app/views/dashboard/_widget.html.haml 
```        

5. app/views/dashboard/_widget.html.haml       
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/_widget.html.haml#L8   

```
= h(presenter.widget.title) # 这一行就是 dashboard里面的每个插件的标题，也就是需要汉化的标题
```