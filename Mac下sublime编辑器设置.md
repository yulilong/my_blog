[TOC]

## **1、安装Package Control**    

在安装之前需要自导sublime的版本，打开finder，按快捷键`shift + command + .`显示隐藏文件，选择用户下的资源库，    
选择`Application Support` 文件夹，在里面找到`sublime Text 3` 文件夹，看名字就只到是哪个版本的了。    

安装`Package Control`参考链接： https://packagecontrol.io/installation    

1. 打开sublime，按`ctrl+`` 快捷键，或者在菜单栏：`View -> Show Console`打开控制台。    

2. 复制下面代码回车    

```
import urllib.request,os,hashlib; h = '6f4c264a24d933ce70df5dedcf1dcaee' + 'ebe013ee18cced0ef93d5f746d80ef60'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

3. 检查是否安装成功：`Sublime Text -> Preferences -> Package Control`    

点击Preferences。如果安装成功了，Package Settings 、Package Control会出现在菜单里了。   
安装参考链接：https://jingyan.baidu.com/article/455a99508b7ccda1662778e0.html    

## **2、sublime 使用Package Control安装插件**

1. 使用快捷键`shift + command + p`或 `Sublime Text -> Preferences -> Package Control`打开Package Control     

2. 输入`Install Package`，选择安装包。  

3. 输入需要安装的包名，在出来的选项中找到包，点击后，会自动安装，安装进度看sublime左下角的进度提示   

4. 包的安装路径:`/Users/dragon/Library/Application Support/Sublime Text 3/Installed Packages`    

## **3、删除插件、更新插件**   

1. 使用快捷键`shift + command + p`或 `Sublime Text -> Preferences -> Package Control`打开Package Control   
2. 删除插件
   1. 在Package Control 中 输入`Remove Package`选择`Package Cont:Remove Package`   
   2. 在里面选择需要的删除插件名字，点击即可删除

3. 更新插件 
    在Package Control 中 输入`upgrade packages`选择`Package Cont:Upgrade/Overwrite All Packages`    


## **4、一些包插件**   

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



## 5、sublime快捷键



```
cmd + K cmd + B   		//显示隐藏侧边栏 (文件目录)
```



## 6、修改sublime默认快捷键

参考链接： https://blog.csdn.net/xuchao2015/article/details/52556927        

打开sublime，左上角：sublime Text -> Preferences -> Key Bindings, 打开修改快捷键文件。

文件左边内容类似于：

```
[
	{ "keys": ["super+shift+n"], "command": "new_window" },
	{ "keys": ["super+shift+w"], "command": "close_window" },
	{ "keys": ["super+o"], "command": "prompt_open" },
	{ "keys": ["super+shift+t"], "command": "reopen_last_file" },		
]
```

keys里面是快捷键，command里面是快捷键说明。

```
up
down
right
left
insert
home
end
pageup
pagedown
backspace
delete
tab
enter
shift
ctrl
alt
super (这个就是win键, mac上是commond键)
```

找到需要修改的快捷键，然后在右边修改：

```
[
	//{ "keys": ["super+shift+d"], "command": "duplicate_line" },
	{ "keys": ["super+d"], "command": "duplicate_line" },	// 复制一行
	 { "keys": ["ctrl+alt+l"], "command": "reindent" },  	// 格式化代码
]
```



## 7、编辑中一些快捷操作

- 从编辑器中打开finder，

  编辑器打开一个文件，在编辑区右键 -> Reveal in Finder,即可在finder中显示这个文件。