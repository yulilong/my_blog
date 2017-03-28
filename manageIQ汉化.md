* **代码版本**   
https://github.com/ManageIQ/manageiq/tree/euwe-1       
-----    

* **I18自动转化成网页当前语言的包**         
rails I18n 资料： http://guides.ruby-china.org/i18n.html     
https://github.com/svenfuchs/rails-i18n             
https://rubygems.org/gems/rails-i18n       
Gemfile 里面：`gem "rails-i18n", "~>5.x"`    
.rb文件里引用：`require 'rails_i18n'`          

* **汉化的文件**     

manageiq/locale/zh_CN/manageiq.po       
manageiq/app/assets/javascripts/locale/zh_CN/app.js      


## dashboard 页面标题的汉化      

* 网址： 
http://localhost:3000/dashboard/show     

*  controller处理信息     
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/controllers/dashboard_controller.rb#L88      
这里面对数据进行处理后，view调用默认的show页面对数据进行渲染。      

*  app/views/dashboard/show.html.haml 网页渲染。     

```
# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/show.html.haml#L8 
# 这一行显示数据接着处理，此时跳到另个文件里继续执行程序
= WidgetPresenter.new(self, controller, widget).render_partial   
```    

*  app/presenters/widget_presenter.rb 对 render_partial 方法进行处理    
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/presenters/widget_presenter.rb#L19      

```
def render_partial
    @controller.render_to_string(:template => 'dashboard/_widget', :handler => [:haml], 
                                 :layout => false, :locals => {:presenter => self}).html_safe
end
# :template => 'dashboard/_widget', :handler => [:haml], 
# 这里是调用app/views/dashboard/_widget.html.haml 
```        

*  app/views/dashboard/_widget.html.haml       

```
# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/_widget.html.haml#L8   
= h(presenter.widget.title) # 这一行就是 dashboard里面的每个插件的标题，也就是需要汉化的标题    

# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/_widget.html.haml#L35 
= render :partial => 'widget_footer', :locals => {:widget => presenter.widget}
# 这里是每个小插件下面的时间显示设置，指向文件位置： app/views/dashboard/_widget_footer.html.haml   

# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/_widget_footer.html.haml#L10
= _('Never')
# 这行会根据地区自动来转换翻译
# https://github.com/ManageIQ/manageiq/blob/euwe-1/locale/zh_CN/manageiq.po
msgid "Next"
msgstr "下次更新"

# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/_widget_footer.html.haml#L15
= format_timezone(next_run_on, session[:user_tz], "widget_footer")
# 这里是把时间转换为中国区的， format_timezone 所在文件：lib/vmdb/global_methods.rb#L36
# https://github.com/ManageIQ/manageiq/blob/euwe-1/lib/vmdb/global_methods.rb#L36
def format_timezone(time, timezone = Time.zone.name, ftype = "view")
  new_time = I18n.l(new_time.to_date) + new_time.strftime(" %H:%M:%S %Z") # 这里就是时间格式转换的代码
# 这里进行了中国区的时间转换

```    

* 展示板里面的插件数据库位置     

数据库名： `vmdb_development`       
表名： `miq_widgets`      
字段： `title`    
```
"Guest OS Information"
"Hosts - Summary by Version"
"Vendor and Guest OS Chart"
"Virtual Infrastructure Platforms"
"Top CPU Consumers (weekly)"
"Top Memory Consumers (weekly)"
"Top Storage Consumers"
"EVM: Recently Discovered Hosts"
"EVM: Recently Discovered VMs"
"Tenant Quotas"
```     

* http://localhost:3000/dashboard/show   页面左上角 "Default Dashboard" 出处   

```

# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/layouts/_tabs.html.haml#L7  
= h(tab[1])
# 这里列出了"Default Dashboard"字段   

# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/layouts/_content.html.haml#L122
= render :partial => 'layouts/tabs'
# 这里是调用tab字段

# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/layouts/application.html.haml#L52 
= render :partial => "layouts/content"
# 这里是调用 content

# views/layouts/_tabs.html.haml 中变量 @tabs 的定义处：
# https://github.com/ManageIQ/manageiq/blob/euwe-1/app/controllers/dashboard_controller.rb#L96
def show
    @layout    = "dashboard"
    @dashboard = true
    @display = "dashboard"
    @lastaction = "show"
    @tabs = []  # 这里把 "Default Dashboard" 汉化了,在这个方法后面用I18n来转化

```      

* **汉化代码**

1、 dashboard页面的标题汉化     

https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/dashboard/_widget.html.haml#L8       
```
@@ -5,7 +5,13 @@
   .card-pf
     .card-pf-heading
       %h2.card-pf-title.sortable-handle{:style => "cursor:move"}
-        = h(presenter.widget.title)
+        - if :"zh-CN" == I18n.locale
+          - begin
+            = I18n.t presenter.widget.title, raise: true
+          - rescue
+            = h(presenter.widget.title)
+        - else
+          = h(presenter.widget.title)
         .dropdown.dropdown-kebab-pf.pull-right
```      
https://github.com/ManageIQ/manageiq/blob/euwe-1/locale/zh_CN.yml#L7       
```
+
+  "Vendor and Guest OS Chart": "供应商和客户操作系统图"
+  "Guest OS Information": "客户操作系统信息"
+  "Hosts - Summary by Version": "主机 - 摘要 与 版本"
+  "Virtual Infrastructure Platforms": "虚拟基础设施平台"
+  "Top CPU Consumers (weekly)": "最高CPU使用者(每周)"
+  "Top Memory Consumers (weekly)": "最高内存使用者(每周)"
+  "Top Storage Consumers": "最高存储使用者"
+  "EVM: Recently Discovered Hosts": "引擎：最近发现的主机"
+  "EVM: Recently Discovered VMs": "引擎: 最近发现的虚拟机"
+  "Tenant Quotas": "租户配额"
+  "Default Dashboard": "默认展示板"
```      
2、dashboard页面 中左上角 "Default Dashboard" 的汉化     
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/controllers/dashboard_controller.rb#L204     
```
@@ -202,6 +202,16 @@ class DashboardController < ApplicationController
       @widgets_menu[:allow_reset] = can_reset
     end
 
+    if :"zh-CN" == I18n.locale
+      @tabs.each { |e|
+        begin
+          e[1] = I18n.t e[1], raise: true
+        rescue
+        end
+      }
+    end
+
+
     # Make widget presenter forget chart data from previous HTTP request handled
```