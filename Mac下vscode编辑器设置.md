***目录***   

[TOC]

## 1. 配置设置    

打开配置文件：    
vscode菜单： Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件。 

### 1.1 设置一个tab键为两个空格

```
// 一个制表符等于的空格数。该设置在 `editor.detectIndentation` 启用时根据文件内容进行重写。
  "editor.tabSize": 2,
// 设置tab键的空格数量为2
"[html]": {
    "editor.tabSize": 2
  },
  "[css]": {
    "editor.tabSize": 2
  },
  "[javascript]": {
    // 按 "Tab" 时插入空格。该设置在 `editor.detectIndentation` 启用时根据文件内容进行重写。
    "editor.insertSpaces": true,
    // 一个制表符等于的空格数。该设置在 `editor.detectIndentation` 启用时根据文件内容进行重写。
    "editor.tabSize": 2
  },
  "[typescript]": {
    "editor.tabSize": 2
  },
```

## 2. 快捷键设置   

打开快捷键页面：     
vscode菜单： Code -> Preferences -> Keyboard Shortcuts , 打开快捷键界面。   

### 2.1 复制一行快捷键自定义：command + D    

在搜索框中输入： `copy`, 找到`Copy Line Down`向下复制一行快捷键，修改为自己习惯的快捷键：`command + D`。       

### 2.2 格式化代码快捷键： control + alt + L 

在搜索框中输入：`format`, 找到`Format Document`格式化文档，修改为自己的快捷键：`control + alt + L`，    
默认的快捷键：`shift + alt + F`.      

### 2.3 删除一行快捷键： command + delete   

在搜索框中输入：`delete`, 找到`Delete Line`删除一行，修改为自己的快捷键：`command + delete`，    
默认的快捷键：`shift + command + K`.   

### 2.4 将选择添加到下一个查找匹配项(Add Selection To Next Find Match)      
在快捷键页面搜索框中输入：`Add Selection To Next`(将选择添加到下一个)        
事件的默认快捷键：`cmd + D`

## 3. vscode的一些插件    

### 3.1 Beautify ：代码变得非常好看的格式      

它可以让你的html，javascript,json,CSS,Sacc 和 html 代码变得非常好看的格式

### 3.2 GitLens supercharges : 显示每行代码GIT的提交记录

### 3.3 CSS Peek：追踪至样式表中 CSS 类和 ids 定义的地方

使用此插件，你可以追踪至样式表中 CSS 类和 ids 定义的地方。当你在 HTML 文件中右键单击选择器时，选择“ Go to Definition 和 Peek definition ”选项，它便会给你发送样式设置的 CSS 代码。

[CSS peek](https://marketplace.visualstudio.com/items?itemName=pranaygp.vscode-css-peek)



### 3.4 color info: css中颜色的其他写法

这个便捷的插件，将为你提供你在 CSS 中使用颜色的相关信息。你只需在颜色上悬停光标，就可以预览色块中色彩模型的（HEX、 RGB、HSL 和 CMYK）相关信息了。

[color info](https://marketplace.visualstudio.com/items?itemName=bierner.color-info)

### 3.5 Document This：自动为TSc和JS文件生成详细的JSDoc注释

“Document This”是一个Visual Studio代码扩展，可自动为TypeScript和JavaScript文件生成详细的JSDoc注释。

### 3.6 vscode-icons:资源树目录加上图标

[vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons)

安装手使用：

- `Linux` & `Windows` `=>` File > Preferences > File Icon Theme > VSCode Icons.
- `MacOS` `=>` Code > Preferences > File Icon Theme > VSCode Icons.

### 3.7 Auto Rename Tag:修改标签名称的时候自动修改结束标签

Auto Rename Tag，非常实用！要修改标签名称的时候自动修改结束标签，节省一半时间，提升效率，非常棒！

[Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)



### 其他插件资料：

https://zhuanlan.zhihu.com/p/27905838

[vscode 插件推荐 - 献给所有前端工程师  segmentfaul](https://segmentfault.com/a/1190000006697219)





