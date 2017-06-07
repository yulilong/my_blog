### **package.json介绍**    

package.json文件描述了一个NPM包的所有相关信息，包括作者、简介、包依赖、构建等信息。格式必须是严格的JSON格式。        
通常我们在创建一个NPM程序时，可以使用`npm init`命令，通过交互式的命令，自动生成一个package.json文件，里面包含了常用的一些字段信息，但远不止这么简单。通过完善package.json文件，我们可以让npm命令更好地为我们服务。        
在终端输入`npm init`会询问package.json的各种信息，从而确认。如果全部使用默认值，可以直接在终端输入`npm init –y`快速生成package.json。    

### **name**     

package.json中最重要的属性是name和version两个属性，这两个属性是必须要有的，否则模块就无法被安装，这两个属性一起形成了一个npm模块的唯一标识符。模块中内容变更的同时，模块版本也应该一起变化。
name属性就是你的模块名称，下面是一些命名规则:       

* name必须小于等于214个字节，包括前缀名称在内（如 xxx/xxxmodule）。
* name不能以"_"或"."开头
* 不能含有大写字母
* name会成为url的一部分，不能含有url非法字符
* 下面是官网文档的一些建议：
* 不要使用和node核心模块一样的名称
* name中不要含有"js"和"node"。 It's assumed that it's js, since you're writing a package.json file, and you can specify the engine using the "engines" field. (See below.)
* name属性会成为模块url、命令行中的一个参数或者一个文件夹名称，任何非url安全的字符在name中都不能使用，也不能以"_"或"."开头
* name属性也许会被写在require()的参数中，所以最好取个简短而语义化的值。
* 创建一个模块前可以先到后边的网址查查name是否已经被占用. https://www.npmjs.com/      

name属性可以有一些前缀如 e.g. `@myorg/mypackage`在npm-scope(7)的文档中可以看到详细说明         

###  **version**    

version必须可以被npm依赖的一个[node-semver](https://github.com/npm/node-semver)模块解析。具体规则见下面的dependencies模块      

### **description**    

一个描述，方便别人了解你的模块作用，搜索的时候也有用。      
包的描述信息，将会在`npm search`的返回结果中显示，以帮助用户选择合适的包。     

### **keywords**     

一个字符串数组，方便别人搜索到本模块.    
包的关键词信息，是一个字符串数组，同上也将显示在`npm search`的结果中。     

### **homepage**     

项目主页url      
**注意:** 这个项目主页url和url属性不同，如果你填写了url属性，npm注册工具会认为你把项目发布到其他地方了，获取模块的时候不会从npm官方仓库获取，而是会重定向到url属性配置的地址。    

### **bugs**    

填写一个bug提交地址或者一个邮箱，被你的模块坑到的人可以通过这里吐槽，例如：     
```
bugs: {  
  "url": "http://github.com/ijse/project/issues",
  "email": "my@ijser.cn"
}
```    
url和email可以任意填或不填，如果只填一个，可以直接写成一个字符串而不是对象。如果填写了url，npm bugs命令会使用这个url。     

### **license**    

你应该为你的模块制定一个协议，让用户知道他们有何权限来使用你的模块，以及使用该模块有哪些限制。最简单的，例如你用BSD-3-Clause 或 MIT之类的协议，如下：        
{ "license" : "BSD-3-Clause" }         
你可以在https://spdx.org/licenses/ 这个地址查阅协议列表 。          

### **和用户相关的属性: author, contributors**     

"author"是一个码农， "contributors"是一个码农数组。 "person"是一个有一些描述属性的对象，如下 like this:    
```
author: {  
  "name": "ijse",
  "email": "my@ijse.cn",
  "url": "http://www.ijser.cn"
}
```    
也可以按如下格式缩写，npm会帮着转换:           
`"author: Barney Rubble b@rubble.com (http://barnyrubble.tumblr.com/)"`        
email和url属性实际上都是可以省略的。描述用户信息的还有一个"maintainers"（维护者）属性。