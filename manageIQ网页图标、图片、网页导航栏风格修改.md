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