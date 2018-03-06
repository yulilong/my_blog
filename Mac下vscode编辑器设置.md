***目录***   

[TOC]

## 配置设置    

打开配置文件：    
vscode菜单： Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件。 

### 设置一个tab键为两个空格

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

## 快捷键设置   

打开快捷键页面：     
vscode菜单： Code -> Preferences -> Keyboard Shortcuts , 打开快捷键界面。   

### 复制一行快捷键自定义：command + D    

在搜索框中输入： `copy`, 找到`Copy Line Down`向下复制一行快捷键，修改为自己习惯的快捷键：`command + D`。       

### 格式化代码快捷键： control + alt + L 

在搜索框中输入：`format`, 找到`Format Document`格式化文档，修改为自己的快捷键：`control + alt + L`，    
默认的快捷键：`shift + alt + F`.      

### 删除一行快捷键： command + delete   

在搜索框中输入：`delete`, 找到`Delete Line`删除一行，修改为自己的快捷键：`command + delete`，    
默认的快捷键：`shift + command + K`.   

### 将选择添加到下一个查找匹配项(Add Selection To Next Find Match)      
在快捷键页面搜索框中输入：`Add Selection To Next`(将选择添加到下一个)        
事件的默认快捷键：`cmd + D`

## vscode的一些插件    

### Beautify ：代码格式化插件      

### GitLens supercharges : 显示每行代码GIT的提交记录