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