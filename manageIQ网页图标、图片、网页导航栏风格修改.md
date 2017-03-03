* **代码版本**   
https://github.com/ManageIQ/manageiq/tree/euwe-1       
-----

## **登录首页图标的修改**   

![WX20170302-145333.png](https://bitbucket.org/repo/oE6yEX/images/450901201-WX20170302-145333.png)    

* 1.查找相关信息
打开网站后，网页右键-->inspect(检查) --> select an element in the page to inspect it -->    
然后把鼠标放到图标那里，点击一下，就会看见定义信息，

右上角图标信息：       
`<img src="/assets/login-screen-logo-ec4bd0dff8e47d1283c87674ce89d26a1b03d6c85f49f030d3a116c2d963dcfc.png">`   
用户名上面的图标：   
`<img alt="ManageIQ" src="/assets/brand-7005158295b20605eae00a080448d69a9c7b541ee3f99469b86e1bae955b0e89.svg">`         

* **右上角图标的修改**    

```
# manageiq官网镜像下载后虚拟机中代码位置
$ cd /var/www/miq/vmdb
$ find ./ -name "login-screen-logo*" #查找图标信息

# 源代码中定义的图标
./app/assets/images/login-screen-logo.png  #源代码中修改此处就可以，图片替换

# 为了加快网页速度，生成的js共有资源的位置，网页中真实的访问图片位置，
# 官网镜像中为了快速修改，可以直接修改此处
./public/assets/login-screen-logo-cd43380036fc96964823fd8d6d7486fe9bcfcce1498daf0c41d8bc94385511da.png

./public/self_service/images/login-screen-logo.png
```        

* **用户名上面的图片(manageIQ)修改**  

```
# manageiq官网镜像下载后虚拟机中代码位置
$ cd /var/www/miq/vmdb
$ find ./ -name "brand*" #查找图标(manageIQ)位置

# 源代码中定义的图标
./app/assets/images/brand.svg  #源代码中修改此处就可以，图片替换
./public/assets/brand-7005158295b20605eae00a080448d69a9c7b541ee3f99469b86e1bae955b0e89.svg.gz

# 为了加快网页速度，生成的js共有资源的位置，网页中真实的访问图片位置，名字要一样。
./public/assets/brand-7005158295b20605eae00a080448d69a9c7b541ee3f99469b86e1bae955b0e89.svg

./public/self_service/images/brand.svg
./public/self_service/img/brand-alt.svg
./public/self_service/img/brand.svg
./vendor/assets/bower_components/patternfly-sass/assets/images/patternfly/brand-alt.svg
./vendor/assets/bower_components/patternfly-sass/assets/images/patternfly/brand.svg
```     

* **网页标题(title)更改**      

1.这个是文字不是图片，查找定义处：     
```    
# 这里是首页登录的控制器处理部分，在这一喊显示了调用了哪部分视图
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/controllers/dashboard_controller.rb#L357
# 这里是网页渲染，这一行显示了title处理部分， -->title_from_layout 这个方法返回title是什么
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/views/layouts/login.html.haml#L6     
# title_from_layout 方法定义处，这里用I18n来自动转换语言，在语言里写着标题
https://github.com/ManageIQ/manageiq/blob/euwe-1/app/helpers/application_helper.rb#L443   

#最后，这里就是标题定义处，这个有几种语言(汉语，英语等)，别的代码版本不是这个路径，不过还是local这个目录里面，
# 别的版本只要找这个local目录就好了，例如：/var/www/miq/vmdb/config/locales
manageIQ/locale
```     

2.修改标题    
https://github.com/ManageIQ/manageiq/blob/euwe-1/locale/zh_CN.yml      
```
zh-CN:
  product:
    name: ManageIQ   
    name_full: ManageIQ        #name_full: JasCloud
    copyright: "Copyright (c) 2016 ManageIQ。由红帽赞助。"
    support_website: "http://www.manageiq.org"
    support_website_text: "ManageIQ.org"

# 修改后
zh-CN:
  product:
    name: JasCloud
    name_full: JasCloud
    copyright: "Copyright (c) 2017 JasCloud。由中盈安信赞助。"
    support_website: "www.jasgroup.cn"
    support_website_text: "www.jasgroup.cn"
```   
en.yml, es.yml, fr.yml, ja.yml 也需要做相应修改。