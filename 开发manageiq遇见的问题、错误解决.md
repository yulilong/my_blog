* 运行`bin/setup`命令发生错误 
当下载manageiq后运行：    
```
[manageiq]$ bin/setup 
== Seeding database ==
ActionCable version is 5.0.1 or newer, please see if we still need this patch: /home/yulilong/tmp/manageiq2016-12-30/config/initializers/action_cable_patch.rb!
** Using session_store: ActionDispatch::Session::MemCacheStore
rails aborted!
ActiveModel::MissingAttributeError: can't write unknown attribute `region_number`
/home/yulilong/.rvm/gems/ruby-2.3.0/gems/activerecord-5.0.1/lib/active_record/attribute.rb:182:in `with_value_from_database'
/home/yulilong/.rvm/gems/ruby-2.3.0/gems/activerecord-5.0.1/lib/active_record/attribute.rb:63:in `forgetting_assignment'
/home/yulilong/.rvm/gems/ruby-2.3.0/gems/activesupport-5.0.1/lib/active_support/core_ext/hash/transform_values.rb:16:in `block in transform_values'
/home/yulilong/.rvm/gems/ruby-2.3.0/gems/activesupport-5.0.1/lib/active_support/core_ext/hash/transform_values.rb:15:in `each'
/home/yulilong/.rvm/gems/ruby-2.3.0/gems/activesupport-5.0.1/lib/active_support/core_ext/hash/transform_values.rb:15:in `transform_values'
/home/yulilong/.rvm/gems/ruby-2.3.0/gems/activerecord-5.0.1/lib/active_record/attribute_set/builder.rb:26:in `transform_values'
```      
查看rails版本：   
```
$ rails -v
Rails 5.0.0.1
```    
在rails 版本是 5.0.0.1下，解决方法： 
打开Gemfile文件，修改如下：
```
-gem "rails",                          "~>5.0.0", ">= 5.0.0.1"
+gem "rails",                          "~>5.0.0", ">= 5.0.0.1", "< 5.0.1"
```    
保存后，删除Gemfile.lock文件，然后从新运行命令即可解决问题。    

* 修改官方虚拟机中的.js文件不起作用       

下载： http://releases.manageiq.org/manageiq-ovirt-euwe-1-rc2.ova    
运行这个虚拟机后，修.rb文件时有效的，但是修改.js文件时不起作用的，经查找，虚拟机中.js文件已经编译了，
网页访问的资源(/var/www/miq/vmdb/public/assets). .js文件编译后都放在这个文件中了。
如果修改了.js文件，那么在虚拟机中运行:    
```
# bin/update
$ bin/rails evm:compile_assets
```
