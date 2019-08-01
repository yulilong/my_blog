* ***显示gem的帮助和版本 ***      
```
gem –h/--help 
#显示gem的帮助
gem –v /--version 
#显示gem的版本号 
```

* ***列出远程库的所有可用软件***      
```
gem query --remote         
# 短命令: gem q -r  
```

* ***查找远程主机上的特定软件***      
```
gem query --remote --name-matches doom 
# 短命令: gem q -rn doom 
# 你将看到一个匹配doom的详细列表。 
gem list –remote --d 
#用子命令list列出远程安装的gems 
```

* ***安装一个远程软件***      
```
gem install --remote progressbar 
# 短命令: gem i -r progressbar –y 
# 远程安装progressbar到你的主机，-y的意思是无条件的安装依赖包 
gem install rails –remote 
#从远程服务器安装rails包，其中rails可以被替换成任何一个gem list –remote –d中显示的软件包 
```

* ***安装软件的特定版本***      
```
gem ins -r progressbar-0.0.3 
# 安装progressbar的0.0.3版本 
gem ins -r progressbar --version '> 0.0.1' 
# 将安装progressbar的大于0.0.1的最新版本  
```

* ***查看一个已安装的软件***      
```
gem specification progressbar 
# 短命令: gem spec progressbar 
# 你会看到关于已安装的包progressbar的详细信息。 
```

* ***卸载一个软件***      
```
gem uninstall progressbar 
卸载了progressbar  
```

* ***查看某个已安装的软件***      
```
gem query --local --name-matches doom 
# 短命令: 'gem q -ln doom' 
```

* ***构建gem包***      
```
gem build package.gemspec 
#运用bulid子命令构建gem包
```  

http://www.jb51.net/article/65136.htm     

* **gem引用本地开发的gem包**    
```
gem "azure-armrest", :path => "../azure-armrest/"  #相对路径或者全路径
```