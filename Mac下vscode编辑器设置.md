***目录***   

[TOC]

## 1. 配置设置    

打开配置文件：    
vscode菜单： Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件。 

### 1.1 设置一个tab键为两个空格

```
// 一个制表符等于的空格数。该设置在 `editor.detectIndentation` 启用时根据文件内容进行重写。
  "editor.tabSize": 2,
  // 关闭根据文件类型自动设置tabsize的选项， 2018-08-30，如果不设置上面的可能失效
  "editor.detectIndentation": false,
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

### 1.2 设置代码格式化缩进为2个空格

```
// 一个tab为2个空格
"editor.tabSize": 2,
// 2018-10-20 关闭检测缩进，设置后代码格式化时就会自动变成2个空格了
"editor.detectIndentation": false,
// 按tab键会变成插入空格
"editor.insertSpaces": true,
```

https://blog.csdn.net/example440982/article/details/81543096?utm_source=blogxgwz1

### 1.3 关闭文件预览

单击文件名的缘故，这个是“预览模式”，所以再单击其他文件时，会覆盖当前打开的文件。

预览模式是现在各类编辑器的默认功能，如果你实在不喜欢，可以关掉的,给你配置`settings.json`里加一条：

```
"workbench.editor.enablePreview": false,
```

### 1.4 react中可以使用emmet

在配置文件中加入下面代码：

```
"emmet.syntaxProfiles": { "javascript": "jsx" },
```

### 1.5 关闭右侧缩略图（预览面板）

设置里面搜索 "editor.minimap.enabled"，设置为false即可。

配置文件中：

```
// Controls if the minimap is shown 关闭右侧缩略图（预览面板）
"editor.minimap.enabled": false,
```



### 1.6 编辑区域面板拆分

右上角 View -> Editor Layout -> 即可选择编辑区域拆分

还可以点击编辑器右上角的拆分按钮，默认垂直拆分， 键盘按住`alt`键，然后点击此时可水平拆分。



### 1.7 前端vue相关配置

#### 1.7.1 设置.vue文件HTML模板中emmet支持vue特有的标签

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件。 

```
  // 2018-07-17 设置VUE在.vue的模板HTML中vue标签也可以使用emmet 
  // 启用后，按下 TAB 键，将展开 Emmet 缩写。
  "emmet.triggerExpansionOnTab": true,
  // vscode 1.25.1版本以后不写下面的配置也会生效，旧版本可能需要
  "emmet.includeLanguages": {
    "vue-html": "html",
    "vue": "html"
  },
```

### 1.8 关闭点击对应文件是，资源管理器自动定位到该文件

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件

```
// 控制资源管理器是否应在打开文件时自动进行显示并选择。
  "explorer.autoReveal": false,
```

### 1.9 标题栏显示文档全路径

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件：

```
"window.title": "${activeEditorLong}${separator}${rootName}"
```

activeEditorMedium:相对于工作区文件夹的文件路径 (如 myFolder/myFile.txt)。

activeEditorLong:文件的完整路径 (如 /Users/Development/myProject/myFolder/myFile.txt)。

### 1.10 关闭编辑器的预览，免得打开新文件胡替换老的文件

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件：

```
// 控制打开的编辑器是否显示为预览。预览编辑器可以重新使用，直到将其保留(例如，双击或编辑)。
"workbench.editor.enablePreview": false,
```

### 1.11 设置鼠标双击才打开文件

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件：

```
"workbench.list.openMode": "doubleClick",
```

如果想改回单击打开文件，可改回参数：`singleClick`, 设置双击打开文件后，预览模式就不需要在设置了。

### 1.12 编辑器tab标签下面显示打开文件的导航

View -> toggle breadcrumbs

## 2. 快捷键设置   

### 打开快捷键界面和快速找到想要修改的快捷键



- 打开快捷键页面：     

  vscode菜单： Code -> Preferences -> Keyboard Shortcuts , 打开快捷键界面。   

- 快速找到要修改的快捷键

  在搜索中输入相关关键词

- 查看快捷键是否已经被占用

  在搜索中输入快捷键： 比如想要查看'cmd + /'快捷键是否已经被占用，则在搜索框中输入：`"cmd + /"` 如果有结果就说明该快捷键已经被占用了

  shift、control(ctrl)、option(alt)、command(cmd)

### 2.1 复制一行快捷键自定义：command + D    

在搜索框中输入： `copy`, 找到`Copy Line Down`向下复制一行快捷键，修改为自己习惯的快捷键：`command + D`。       

### 2.2 格式化代码快捷键： option + cmd + L 

在搜索框中输入：`format`, 找到`Format Document`格式化文档，修改为自己的快捷键：`control + alt + L`，    
默认的快捷键：`shift + alt + F`.      

### 格式化选中的代码快捷键：cmd + L

在搜索框中输入： formatSelection(格式化选定代码)， 可以修改成自己的快捷键

### 2.3 删除一行快捷键： command + delete   

在搜索框中输入：`delete`, 找到`Delete Line`删除一行，修改为自己的快捷键：`command + delete`，    
默认的快捷键：`shift + command + K`.   

### 2.4 将选择添加到下一个查找匹配项(Add Selection To Next Find Match)      
在快捷键页面搜索框中输入：`Add Selection To Next`(将选择添加到下一个)        
事件的默认快捷键：`cmd + D`

### 切换编辑器组布局(垂直/水平): option + cmd + 数字零

关键字：toggleEditorGroupLayout

### 当前行向上移动一行： option + 向上箭头 

关键字 ： moveLinesUpAction   

### 当前行向下移动一行： option + 向下箭头

关键字： moveLinesDownAction

### 当前行缩进： cmd + ]

indentLines

### 减少行缩进： cmd + [

outdentLines



## 3. vscode一些快捷操作

### 3.1 变量重命名：选中后按F2

可以选中后按F2，输入新的名字，回车，会发现所有的文件都修改过了。



## 4. vscode的一些插件    

### 4.1 Beautify ：代码变得非常好看的格式      

它可以让你的html，javascript,json,CSS,Sacc 和 html 代码变得非常好看的格式

#### 4.1.1 Beautify css/sass/scss/less CSS格式化插件

该插件安装后，可以格式化css/sass/scss/less后缀的CSS文件， 使用VSCODE默认的格式化快捷键即可实现快速格式化

https://marketplace.visualstudio.com/items?itemName=michelemelluso.code-beautifier

### 4.2 GitLens supercharges : 显示每行代码GIT的提交记录

这个插件安装好后在编辑器右上角会有几个按钮 (其中有一个类似git的图标)

### 4.3 CSS Peek：追踪至样式表中 CSS 类和 ids 定义的地方

使用此插件，你可以追踪至样式表中 CSS 类和 ids 定义的地方。当你在 HTML 文件中右键单击选择器时，选择“ Go to Definition 和 Peek definition ”选项，它便会给你发送样式设置的 CSS 代码。

[CSS peek](https://marketplace.visualstudio.com/items?itemName=pranaygp.vscode-css-peek)



### 4.4 color info: css中颜色的其他写法

这个便捷的插件，将为你提供你在 CSS 中使用颜色的相关信息。你只需在颜色上悬停光标，就可以预览色块中色彩模型的（HEX、 RGB、HSL 和 CMYK）相关信息了。

[color info](https://marketplace.visualstudio.com/items?itemName=bierner.color-info)

### 4.5 Document This：自动为TSc和JS文件生成详细的JSDoc注释

“Document This”是一个Visual Studio代码扩展，可自动为TypeScript和JavaScript文件生成详细的JSDoc注释。

[Document This](https://marketplace.visualstudio.com/items?itemName=joelday.docthis)

使用方法：

1. 鼠标光标放在方法名前面。
2. 按快捷键 `Ctrl+Alt+D`再按一次`Ctrl+Alt+D`，即可生成注释文档

### 4.6 vscode-icons:资源树目录加上图标

[vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons)

安装手使用：

- `Linux` & `Windows` `=>` File > Preferences > File Icon Theme > VSCode Icons.
- `MacOS` `=>` Code > Preferences > File Icon Theme > VSCode Icons.

### 4.7 Auto Rename Tag:修改标签名称的时候自动修改结束标签

Auto Rename Tag，非常实用！要修改标签名称的时候自动修改结束标签，节省一半时间，提升效率，非常棒！

[Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)

### 4.8 open native terminal : 在右键菜单中添加打开终端

这个插件可以很方便的直接在VSCODE中打开终端操作

[open native terminal](https://marketplace.visualstudio.com/items?itemName=alexeyvax.vscode-open-native-terminal)



### 4.9 console-snippets: console.log快捷插件

[console-snippets](https://marketplace.visualstudio.com/items?itemName=amandeepmittal.console-snippets)

- `cl` or `clog` console.log()
- `cwarn` console.warn()
- `cdir` console.dir()
- `ci` console.info()
- `cerr` console.error()
- `cg` console.group()
- `cge` console.groupEnd()



### 4.10 Turbo Console Log: 选中变量快捷添加console.log

[Turbo Console Log ](https://marketplace.visualstudio.com/items?itemName=ChakrounAnas.turbo-console-log)

使用方法： 1，选中变量， 2 按快捷键： `control + option + i`

- 注释掉有插件创建的console： `control + option + q`
- 取消注释插件创建的console：`control + option + u`
- 删除由插件创建的console: `control + option + d`

注：此插件的创建console与我自己的快捷键冲突了，可打开vscode的快捷键设置，

然后搜索：Turbo Console Log ， 就会出现此插件相关的快捷键，选择冲突的快捷键修改别的快捷。

### 4.11 Vim：让vscode像vim中一样使用命令

[Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)



### 4.12 Bookmarks：添加标签，快速定位标记的代码

 Visual Studio中的Bookmark能加速代码导航能力。可能有一些代码，需要频繁的相互切换。通常你可能是滚动页面，找到该代码块的。Visual Studio已经提供了通过使用快捷键，非常快速地移动到指定的代码段。这就是代码的书签功能。

[bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)

可设置快捷键，打开快捷键页面（code -> Preferences -> keyboards ShortCuts）

在里面输入`bookmarks`就能看见相关的快捷键设置:

`option + cmd + k`:开启关闭标签

`option + cmd + L`:跳到下一个标签

`option + cmd + k`:跳到上一个标签

还可以在编辑器左边有个书签图标，可以点击在里面管理添加的书签。

可以选一个文件，然后右键店家clear清理所有标记的标签。

### 4.13 Bracket Pair Colorizer:代码的各种括号呈现不同的颜色

[Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)

让代码的各种括号呈现不同的颜色。



### 4.14 ESLint: JavaScript代码格式化检查插件

[ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

https://github.com/Microsoft/vscode-eslint

注意：

如果在配置文件中写了：

```
"eslint.autoFixOnSave": true,
```

那么在保存文件的时候，会自动把代码格式化成符合eslint风格的代码，比如把`var`变量自动变成`let`



## 5. VUE框架相关的插件

### 5.1 vetur：语法高亮插件

### 5.2 Vue VSCode Snippets: vue模板 

安装此插件后，在.vue文件中 输入vbase然后按tab键可以快速生成一个vue项目的模板。其他的请看文档

[Vue VSCode Snippets](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets)

## 6. 使用vscode遇到的问题

### 6.1 html文件使用快捷键注释不对

当在HTML文件中，使用注释快捷键`cmd + /`，时注释的代码是下面这样子的：

```
{# <p></p> #}
```

这个是错误的。

1、首先查看编辑器右下角看看是不是HTML格式的，然后在看看配置等。

2、经过我的查找是由于使用了插件导致的，插件名字：`TWIG pack`,禁用这个插件后，再次使用快捷键注释就好了：

```html
<!-- <p></p> -->
```

### 6.2 保存时，自动把var变量改成了let

在打开代码文件时，修改后，保存后，发现编辑器把var变量自动改成了let，导致旧浏览器出现了兼容性问题。

经过查询：

1. 安装了eslint插件
2. 在配置文件里面配置了`"eslint.autoFixOnSave": true,`

安装了eslint插件并配置了参数后， 在保存文件的时候，就会自动把不符合eslint格式的代码自动改成符合eslint要求的代码，所以就把var改成了let，导致了旧浏览器出现了兼容性问题。

解决方法：

在配置文件中注销或删除配置：`"eslint.autoFixOnSave": true,`即可。



##  其他插件资料

https://zhuanlan.zhihu.com/p/27905838

[vscode 插件推荐 - 献给所有前端工程师  segmentfaul](https://segmentfault.com/a/1190000006697219)





