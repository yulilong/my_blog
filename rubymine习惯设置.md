* **设置行号**    

MAC OS X 系统：RubyMine | Preferences | Editor | General | Appearance       
1. show line numbers    
2. show whitespaces    

### rubymine2016 汉化    

参考链接：  http://www.jb51.net/softs/516343.html     

[**rubymine2016安装教程**](https://bitbucket.org/yulilong/my_wiki/wiki/Mac%20install%20RVM,ruby,pqadmin3,rubymine2016)         
下载链接：  https://pan.baidu.com/s/1c2ou9w8 密码: kqjh     
**RubyMine 2016汉化包使用方法：**        
解压后，里面有个文件`resources_cn.jar`,把这个文件复制到`/Applications/RubyMine.app/Contents/lib`中      
![WX20170412-152939.png](https://bitbucket.org/repo/oE6yEX/images/661412829-WX20170412-152939.png)    

如果没有`resources_cn.jar`,怎按照下面的步骤来制作`resources_cn.jar`：     
1、链接: https://pan.baidu.com/s/1pLlWpSn 密码: yptn   下载汉化包       
2、将/Applications/RubyMine.app/Contents/lib目录下的resources_en.jar文件复制出来，并更名resources_cn.jar      
3、双击打开resources_cn.jar(注意是打开而不是解压出来)，将下载的汉化包zh_CN目录下的所有文件拖到刚才打开的resources_cn.jar文件内的messages目录中，并保存。            
4、将resources_cn.jar文件复制回/Applications/RubyMine.app/Contents/lib       


### rubymine 颜色设置    

![WX20170412-154746.png](https://bitbucket.org/repo/oE6yEX/images/77549440-WX20170412-154746.png)       

1.  输入行的背景色    
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> General -> Editor -> Caret row

2.  代码编辑区背景色
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> General -> Test -> Default test -> background     

3. 行号的颜色设置    
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> General -> Code -> Line number    

![WX20170412-160435.png](https://bitbucket.org/repo/oE6yEX/images/450904385-WX20170412-160435.png)     

1. 鼠标选择区域前景色(字体颜色)    
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> General -> Editor -> Selection background      
2. 鼠标选择的背景色    
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> General -> Editor -> Selection foreground       

![WX20170412-180743.png](https://bitbucket.org/repo/oE6yEX/images/2747762884-WX20170412-180743.png)       

1. 字符串的颜色设置    
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> String -> String text -> Foreground    
这是通用的设置，如果想某种语言字符串颜色特定 以ruby语言为例：    
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Ruby -> String -> Foreground     
如果勾选了 `Use inherited attributes`则会使用上面的设置，在这里也告诉了此处默认的设置位置`String -> String text` of Language Defaults    

![WX20170412-182734.png](https://bitbucket.org/repo/oE6yEX/images/1064908234-WX20170412-182734.png)       

HTML代码`<div  class=  "line">   &times;    </div    >`    
1. `class=`  颜色背景色设置
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> Markup -> Attribute ->    
Foreground 字体颜色，  Background 背景色      
2. `&times;` 颜色背景色设置   
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> Markup -> Entity ->    
Foreground 字体颜色，  Background 背景色      
3.  ` <    />` 颜色背景色设置     
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> Markup -> Tag ->    
Foreground `<`颜色，  Background 背景色     

![WX20170412-190325.png](https://bitbucket.org/repo/oE6yEX/images/3615565469-WX20170412-190325.png)      

`<div><span>企业信息管理dsdsddddd</span></div>`        
1. div span 字体的颜色设置      
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> Keyword -> Foreground    
2. 没有被任何符号包含(企业信息管理ds)的字体颜色 设置         
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> General -> Text -> Default text -> Foreground       

![WX20170413-094349.png](https://bitbucket.org/repo/oE6yEX/images/869757487-WX20170413-094349.png)     

1. 局部变量颜色设置      
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> Identifiers -> Local variable -> Foreground    
其他语言个性化设置(JavaScript)： Editor ->  Colors & Fonts -> JavaScript -> Local variable -> Foreground     
2. 数字颜色设置     
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> Number -> Foreground     

1. 行注释，块注释 颜色修改     
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> Language Defaults -> Comments -> Line comment -> Foreground      

![WX20170413-104255.png](https://bitbucket.org/repo/oE6yEX/images/1403576230-WX20170413-104255.png)     

`export class EnterpriseListShowComponent implements OnInit {`      
1. `export class` keyword 关键字颜色设置
(JavaScript) Editor ->  Colors & Fonts -> JavaScript -> Keyword -> Foreground  
如果勾选了： Use inherited attributes : Language Defaults -> Keyword
2. 类名字颜色设置     
(JavaScript) Editor ->  Colors & Fonts -> JavaScript -> Class -> Foreground  
如果勾选了： Use inherited attributes : Language Defaults -> Classes -> Class name      

![WX20170413-110636.png](https://bitbucket.org/repo/oE6yEX/images/1937567871-WX20170413-110636.png)   

1. 实例成员方法名颜色设置：    
(JavaScript) Editor ->  Colors & Fonts -> JavaScript -> Instance member function -> Foreground      
如果勾选了： Use inherited attributes : Language Defaults -> Classes -> Instance method     

![WX20170413-113053.png](https://bitbucket.org/repo/oE6yEX/images/29999157-WX20170413-113053.png)      

1. 搜索结果的颜色背景色设置：    
preferences(cmd + ,) -> Editor ->  Colors & Fonts -> General -> Search Results -> Text search result     
搜索结果字体颜色： Foreground ，搜索结果背景色： Background