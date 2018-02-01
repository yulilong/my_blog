[TOC]

## **一、安装Package Control**    

在安装之前需要自导sublime的版本，打开finder，按快捷键`shift + command + .`显示隐藏文件，选择用户下的资源库，    
选择`Application Support` 文件夹，在里面找到`sublime Text 3` 文件夹，看名字就只到是哪个版本的了。    

安装`Package Control`参考链接： https://packagecontrol.io/installation    

### 1. 打开sublime，按`ctrl+`` 快捷键，或者在菜单栏：`View -> Show Console`打开控制台。    

### 2. 复制下面代码回车    

```
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```  

### 3. 检查是否安装成功：`Sublime Text -> Preferences -> Package Control`    

点击Preferences。如果安装成功了，Package Settings 、Package Control会出现在菜单里了。   
安装参考链接：https://jingyan.baidu.com/article/455a99508b7ccda1662778e0.html    

## **二、sublime 使用Package Control安装插件**

### 1. 使用快捷键`shift + command + p`或 `Sublime Text -> Preferences -> Package Control`打开Package Control     

### 2. 输入`Install Package`，选择安装包。  

### 3. 输入需要安装的包名，在出来的选项中找到包，点击后，会自动安装，安装进度看sublime左下角的进度提示   

### 4. 包的安装路径:`/Users/dragon/Library/Application Support/Sublime Text 3/Installed Packages`    

## **三、删除插件、更新插件**   

### 1. 使用快捷键`shift + command + p`或 `Sublime Text -> Preferences -> Package Control`打开Package Control   

### 2. 删除插件

#### ①. 在Package Control 中 输入`Remove Package`选择`Package Cont:Remove Package`    

#### ②，在里面选择需要的删除插件名字，点击即可删除

### 3. 更新插件 

#### ① 在Package Control 中 输入`upgrade packages`选择`Package Cont:Upgrade/Overwrite All Packages`    
  

## **四、一些包插件**   

```
Typescript Syntax: 
typescript语法  

SublimeLinter：代码校验插件，支持 HTML、CSS、JS、PHP、Java、C++ 等16种语言；

Alignment：代码对齐插件；

Git：整合 Git 功能的插件；

BracketHighlighter： 括号高亮匹配

emmet:  HTML 中使用CSS样式语法，然后使用 tab键直接生成对应html元素
```

### Vue Syntax Highlight : VUE语法高亮，并且智能提示