### **package.json介绍**    

package.json文件描述了一个NPM包的所有相关信息，包括作者、简介、包依赖、构建等信息。格式必须是严格的JSON格式。        
通常我们在创建一个NPM程序时，可以使用`npm init`命令，通过交互式的命令，自动生成一个package.json文件，里面包含了常用的一些字段信息，但远不止这么简单。通过完善package.json文件，我们可以让npm命令更好地为我们服务。        
在终端输入`npm init`会询问package.json的各种信息，从而确认。如果全部使用默认值，可以直接在终端输入`npm init –y`快速生成package.json。