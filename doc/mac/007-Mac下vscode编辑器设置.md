[TOC]

## 1. 配置设置

打开配置文件：    
vscode菜单： Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件。 

### 1.1 设置格式化缩进为2个空格

```js
// 一个tab为2个空格
// 如果设置了editor.detectIndentation = true 则会根据根据文件内容进行重写。
"editor.tabSize": 2,
// 2018-10-20 关闭检测缩进，设置后代码格式化时就会自动变成2个空格了
"editor.detectIndentation": false,
// 按tab键会变成插入空格
"editor.insertSpaces": true,
```

### 1.2 设置一类文件tab键为两个空格

```json
 // 2018-10-20 关闭检测缩进，设置后代码格式化时就会自动变成2个空格了
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


https://blog.csdn.net/example440982/article/details/81543096?utm_source=blogxgwz1

#### 1.2.1 设置当前文件缩进

https://blog.csdn.net/qq_34446663/article/details/88184680

1、点击文件右下角的`Tab Size:`，会出现一个选择框。

2、点击`Indent Using Tabs`

3、根据需求，选择自己需要的缩进

### 1.3 关闭文件预览

单击文件名的缘故，这个是“预览模式”，所以再单击其他文件时，会覆盖当前打开的文件。

预览模式是现在各类编辑器的默认功能，如果你实在不喜欢，可以关掉的,给你配置`settings.json`里加一条：

```json
"workbench.editor.enablePreview": false,
```

### 1.4 react中可以使用emmet

在配置文件中加入下面代码：

```json
"emmet.syntaxProfiles": { "javascript": "jsx" },
```

### 1.5 关闭右侧缩略图（预览面板）

设置里面搜索 "editor.minimap.enabled"，设置为false即可。

配置文件中：

```json
// Controls if the minimap is shown 关闭右侧缩略图（预览面板）
"editor.minimap.enabled": false,
```



### 1.6 编辑区域面板拆分

右上角 View -> Editor Layout -> 即可选择编辑区域拆分

还可以点击编辑器右上角的拆分按钮，默认垂直拆分， 键盘按住`alt`键，然后点击此时可水平拆分。



### 1.7 前端vue相关配置

#### 1.7.1 设置.vue文件HTML模板中emmet支持vue特有的标签

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件。 

```json
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

```json
// 控制资源管理器是否应在打开文件时自动进行显示并选择。
  "explorer.autoReveal": false,
```

### 1.9 标题栏显示文档全路径

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件：

```json
"window.title": "${activeEditorLong}${separator}${rootName}"
```

activeEditorMedium:相对于工作区文件夹的文件路径 (如 myFolder/myFile.txt)。

activeEditorLong:文件的完整路径 (如 /Users/Development/myProject/myFolder/myFile.txt)。

### 1.10 关闭编辑器的预览，免得打开新文件胡替换老的文件

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件：

```json
// 控制打开的编辑器是否显示为预览。预览编辑器可以重新使用，直到将其保留(例如，双击或编辑)。
"workbench.editor.enablePreview": false,
```

### 1.11 设置鼠标双击才打开文件

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件：

```json
"workbench.list.openMode": "doubleClick",
```

如果想改回单击打开文件，可改回参数：`singleClick`, 设置双击打开文件后，预览模式就不需要在设置了。

### 1.12 编辑器tab标签下面显示打开文件的导航

View -> toggle breadcrumbs

### 1.13 编辑器文字超出了编辑器可视区域，是否自动在下一行显示

Code -> Preferences -> Settings(快捷键command + ，)，打开配置文件：

```json
// Controls how lines should wrap.
//  - off: Lines will never wrap.
//  - on: Lines will wrap at the viewport width.
//  - wordWrapColumn: Lines will wrap at `editor.wordWrapColumn`.
//  - bounded: Lines will wrap at the minimum of viewport and `editor.wordWrapColumn`.
"editor.wordWrap": "off",
```

### 1.14 修改vscode上终端的字体大小

1、使用`cmd + ,`打开设置页面，或者屏幕左上角 code -> 首选项 -> 设置。

2、搜索终端，或者 功能 -> 终端。

3、找到`Integrated: Font Size`，控制终端的字号，设置成自己想要的字体大小即可。

### 1.15 添加代码片段snippets

https://www.jianshu.com/p/1f1132df1def

https://segmentfault.com/a/1190000018457312

windows系统: File > Preferences > User Snippets，

Mac系统：Code > Preferences > User Snippets

在出现的弹窗中，选择`New Global Snippets file`新建一个全局的代码，或者选择一个已经存在的代码片段继续编辑

vscode代码片段存放路径

`/Users/用户名/Library/Application Support/Code/User/snippets/tt.code-snippets`

例如：`/Users/dragon/Library/Application Support/Code/User/snippets/tt.code-snippets`

### 1.16 编辑代码后自动保存

vscode版本：1.46.0

打开vscode配置文件：code -> preferences -> settings(或者快捷键`cmd + ,`)

![](./img/002-vscode.png)

在setting里面，`Flies: Auto Save` 选择一下。

### 1.17 代码保存后自动格式化

在`settings.json`文件里面添加如下：

```json
// "editor.formatOnType": true,
// 写这一个就可以
"editor.formatOnSave": true
```

https://www.cnblogs.com/hellofangfang/p/9266752.html

### 1.18 代码保存后自动格式化成ESLint规范形式

如果安装了eslint插件，保存代码后，可设置自动格式化成符合eslint规范的代码，在配置文件中添加：

```json
// eslint 保存代码时自动格式化符合eslint规范 2020-06-12
  "editor.codeActionsOnSave": {
    "source.fixAll": true,
    "source.fixAll.eslint": true
  },
```

注意：这个配置随着eslint产检版本升级可能会变化，需要去github上查看：

https://github.com/Microsoft/vscode-eslint

### 1.19 设置自定义代码片段在提示的最上面

在设置中搜索到editor.snippetSuggestions这个设置，其中有四个选项top、bottom、inline、none四个选项，选择top即可。

默认的选项是：inline

![](./img/009-mac.png)



### 1.20 文件夹折叠显示(Compact Folders)

**VS Code 的“文件夹折叠显示”（Compact Folders）** 功能。这个功能会在 **某个文件夹下只有一个子文件夹时**，把它们的名字合并显示成类似：

```css
components/Button/
```

而不是分两层显示：

```css
components
  └── Button
```

**关闭这个功能的方法**：

1. 打开 **设置**（快捷键：`Ctrl + ,` 或 `Cmd + ,`）。
2. 搜索：`compact folders`
3. 关闭 **Explorer: Compact Folders** 选项。

或者直接在 `settings.json` 中添加：

```json
"explorer.compactFolders": false
```

关闭后，VS Code 会恢复为传统的文件夹层级显示。



## 2. 快捷键设置   

打开快捷键界面和快速找到想要修改的快捷键

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

### 2.3 格式化选中的代码快捷键：cmd + L

在搜索框中输入： formatSelection(格式化选定代码)， 可以修改成自己的快捷键

### 2.4 删除一行快捷键： command + delete   

在搜索框中输入：`delete`, 找到`Delete Line`删除一行，修改为自己的快捷键：`command + delete`，    
默认的快捷键：`shift + command + K`.   

### 2.5 将选择添加到下一个查找匹配项(Add Selection To Next Find Match)      
在快捷键页面搜索框中输入：`Add Selection To Next`(将选择添加到下一个)        
事件的默认快捷键：`cmd + D`

### 2.6 切换编辑器组布局(垂直/水平): option + cmd + 数字零

关键字：toggleEditorGroupLayout

### 2.7 当前行向上移动一行： option + 向上箭头 

关键字 ： moveLinesUpAction   

### 2.8 当前行向下移动一行： option + 向下箭头

关键字： moveLinesDownAction

### 2.9 当前行缩进

关键字：indentLines

设置的快捷键: `cmd + ]`

### 2.10 减少行缩进

关键字：outdentLines

设置的快捷键： `cmd + [`



## 3. vscode一些快捷操作

### 3.1 变量重命名：选中后按F2

可以选中后按F2，输入新的名字，回车，会发现所有的文件都修改过了。



## 4. vscode的一些插件

### 安装离线插件

由于有的电脑环境不能连接互联网，可以通过安装离线包方式安装插件。

- 获取离线插件包

  在线搜索插件：`https://marketplace.visualstudio.com/vscode`，或者在vscode插件中，找到插件，然后点击插件名字会直接跳转到插件的网址。

  在出现的插件页面中，点击`Download Extension` 按钮，下载离线包：

  <img src="./img/045-mac-vscode.png" style="zoom: 25%;" />

- 安装离线插件

  1、打开vscode编辑器，点击插件部分。

  2、在搜索框右边的上面有三个点，点击。

  3、在出现的弹窗中，选择`Install from VSIX...`选项。

  4、在出现的弹窗中，选择插件离线包所在的目录，选择需要安装的插件，然后点击`install`按钮进行安装。

  <img src="./img/046-mac-vscode.png" style="zoom: 33%;" />



### 4.1 ESLint: JavaScript代码格式化检查插件

[ESLint 插件](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)，
插件github地址：https://github.com/Microsoft/vscode-eslint

eslint中文官网：http://eslint.cn/

airbnb规范地址：https://github.com/lin-123/javascript

如果想要在保存文件的时候，会自动把代码格式化成符合eslint风格的代码，比如把`var`变量自动变成`let`，需要在配置文件中写了如下配置：

```json
"editor.codeActionsOnSave": {
    "source.fixAll": true,
    "source.fixAll.eslint": true
}
```

注意，这个配置项会随着eslint插件版本升级而改变，需要查看插件的文档来做对应修改。

这个插件生效需要项目里面有eslint配置文件，如：`.eslintrc.js`:

```js
module.exports = {
	parser: 'babel-eslint',
    // 规定了代码检查使用哪个规范，如airbnb
    extends: ['airbnb', 'prettier', 'plugin:compat/recommended'],
}
```

如果不想代码检查某个文件，那么在配置文件里面忽略：`.eslintignore`：

```
/scripts
/config
```

一般在package.json文件里面也安装了对应包，用于命令行检查：

```json
"eslint": "^5.16.0",
"eslint-config-airbnb": "^17.1.0",
"eslint-config-prettier": "^4.3.0",
"eslint-plugin-babel": "^5.3.0",
"eslint-plugin-compat": "^3.1.1",
"eslint-plugin-import": "^2.17.3",
"eslint-plugin-jsx-a11y": "^6.2.1",
"eslint-plugin-markdown": "^1.0.0",
"eslint-plugin-react": "^7.13.0",
```

### 4.2 stylelint：CSS代码规范检查插件

[stylelint 插件地址](https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint)

插件github地址：https://github.com/stylelint/vscode-stylelint

stylelint官网：https://stylelint.io/

stylelint规范地址：https://stylelint.io/user-guide/rules/list

中文介绍：https://segmentfault.com/a/1190000017335655

注意：这个插件有好几个同名的插件，选择图标跟stylelint官网一样的图标插件。

这个插件生效需要项目里面有stylelint的配置文件，如`.stylelintrc.json` 

```json
{
  "extends": [
    "stylelint-config-standard",
    "stylelint-config-css-modules",
    "stylelint-config-rational-order",
    "stylelint-config-prettier"
  ],
  "plugins": ["stylelint-order", "stylelint-declaration-block-no-ignored-properties"],
  "rules": {
    "no-descending-specificity": null,
    "plugin/declaration-block-no-ignored-properties": true
  }
}
```

一般在package.json文件里面也安装了对应包，用于命令行检查：

```json
"stylelint": "^10.0.1",
"stylelint-config-css-modules": "^1.4.0",
"stylelint-config-prettier": "^5.2.0",
"stylelint-config-rational-order": "^0.1.2",
"stylelint-config-standard": "^18.3.0",
"stylelint-declaration-block-no-ignored-properties": "^2.1.0",
"stylelint-order": "^3.0.0",
```



### 4.3 适用于 VS Code 的中文（简体）语言包

[Chinese (Simplified) Language Pack for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-zh-hans)

安装后，在 `locale.json` 中添加 `"locale": "zh-cn"`，即可载入中文（简体）语言包。要修改 `locale.json`，你可以同时按下 `Ctrl+Shift+P` 打开**命令面板**，之后输入 "config" 筛选可用命令列表，最后选择**配置语言**命令。请参阅[文档](https://go.microsoft.com/fwlink/?LinkId=761051)并获取更多信息。

### 4.4 Beautify ：代码变得非常好看的格式      

它可以让你的html，javascript,json,CSS,Sacc 和 html 代码变得非常好看的格式

#### 4.4.1 Beautify css/sass/scss/less CSS格式化插件

该插件安装后，可以格式化css/sass/scss/less后缀的CSS文件， 使用VSCODE默认的格式化快捷键即可实现快速格式化

https://marketplace.visualstudio.com/items?itemName=michelemelluso.code-beautifier

### 4.5 GitLens supercharges : 显示每行代码GIT的提交记录

这个插件安装好后在编辑器右上角会有几个按钮 (其中有一个类似git的图标)

### 4.6 CSS Peek：追踪至样式表中 CSS 类和 ids 定义的地方

使用此插件，你可以追踪至样式表中 CSS 类和 ids 定义的地方。当你在 HTML 文件中右键单击选择器时，选择“ Go to Definition 和 Peek definition ”选项，它便会给你发送样式设置的 CSS 代码。

[CSS peek](https://marketplace.visualstudio.com/items?itemName=pranaygp.vscode-css-peek)



### 4.7 color info: css中颜色的其他写法

这个便捷的插件，将为你提供你在 CSS 中使用颜色的相关信息。你只需在颜色上悬停光标，就可以预览色块中色彩模型的（HEX、 RGB、HSL 和 CMYK）相关信息了。

[color info](https://marketplace.visualstudio.com/items?itemName=bierner.color-info)

### 4.8 Document This：自动为TSc和JS文件生成详细的JSDoc注释

“Document This”是一个Visual Studio代码扩展，可自动为TypeScript和JavaScript文件生成详细的JSDoc注释。

[Document This](https://marketplace.visualstudio.com/items?itemName=joelday.docthis)

使用方法：

1. 鼠标光标放在方法名前面。
2. 按快捷键 `Ctrl+Alt+D`再按一次`Ctrl+Alt+D`，即可生成注释文档

### 4.9 vscode-icons:资源树目录加上图标

[vscode-icons](https://marketplace.visualstudio.com/items?itemName=robertohuertasm.vscode-icons)

安装手使用：

- Linux & Windows => File > Preferences > File Icon Theme > VSCode Icons.
- MacOS => Code > Preferences > File Icon Theme > VSCode Icons.

### 4.10 Auto Rename Tag:修改标签名称的时候自动修改结束标签

Auto Rename Tag，非常实用！要修改标签名称的时候自动修改结束标签，节省一半时间，提升效率，非常棒！

[Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)

### 4.10 自动关闭标签：Auto Close Tag

[Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)

自动重命名成对的HTML/XML标记，与Visual Studio IDE相同。用这个插件可以告别每次改变标签的时候要重复修改头部和尾部标签。特别是标签内内容非常多的时候，要改确实很费劲的。



### 4.11 open native terminal : 在右键菜单中添加打开终端

这个插件可以很方便的直接在VSCODE中打开终端操作

[open native terminal](https://marketplace.visualstudio.com/items?itemName=alexeyvax.vscode-open-native-terminal)



### 4.12 console-snippets: console.log快捷插件

[console-snippets](https://marketplace.visualstudio.com/items?itemName=amandeepmittal.console-snippets)

- `cl` or `clog` console.log()
- `cwarn` console.warn()
- `cdir` console.dir()
- `ci` console.info()
- `cerr` console.error()
- `cg` console.group()
- `cge` console.groupEnd()



### 4.13 Turbo Console Log: 选中变量快捷添加console.log

[Turbo Console Log ](https://marketplace.visualstudio.com/items?itemName=ChakrounAnas.turbo-console-log)

使用方法： 1，选中变量， 2 按快捷键： `control + option + i`

- 注释掉有插件创建的console： `control + option + q`
- 取消注释插件创建的console：`control + option + u`
- 删除由插件创建的console: `control + option + d`

注：此插件的创建console与我自己的快捷键冲突了，可打开vscode的快捷键设置，

然后搜索：Turbo Console Log ， 就会出现此插件相关的快捷键，选择冲突的快捷键修改别的快捷。

### 4.14 Vim：让vscode像vim中一样使用命令

[Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)



### 4.15 Bookmarks：添加标签，快速定位标记的代码

 Visual Studio中的Bookmark能加速代码导航能力。可能有一些代码，需要频繁的相互切换。通常你可能是滚动页面，找到该代码块的。Visual Studio已经提供了通过使用快捷键，非常快速地移动到指定的代码段。这就是代码的书签功能。

[bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)

可设置快捷键，打开快捷键页面（code -> Preferences -> keyboards ShortCuts）

在里面输入`bookmarks`就能看见相关的快捷键设置:

`option + cmd + k`:开启关闭标签

`option + cmd + L`:跳到下一个标签

`option + cmd + k`:跳到上一个标签

还可以在编辑器左边有个书签图标，可以点击在里面管理添加的书签。

可以选一个文件，然后右键店家clear清理所有标记的标签。

### 4.16 Bracket Pair Colorizer:代码的各种括号呈现不同的颜色

[Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)

让代码的各种括号呈现不同的颜色。





### 4.17 对 webpack 别名路径或者自定义别名路径进行快速跳转的插件

[Jump To Alias File](https://marketplace.visualstudio.com/items?itemName=wanfu.jump-to-alias-file)

https://github.com/wanfu920/jumpToAliasFile

可以对 webpack 别名路径或者自定义别名路径进行快速跳转的插件.

默认webpack配置的alias可自动识别  如果没识别 可以在setting.json里配置webpeckConfigPath或者jumpToAliasFile.alias

### 4.18 计算引入包的大小

[Import Cost](https://marketplace.visualstudio.com/items?itemName=wix.vscode-import-cost)

插件会在代码import一个包后计算该包的大小

### 4.19 设置tab强调色

[Material Theme](https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme)

插件安装好后，会修改vscode编辑器主题色，可以修改回原先的主题色。

修改打开标签页下划线颜色：

打开命令面板(cmd + shift + P)，输入`Material`，选择`Material Theme: Set accent color`，然后从出现的列表中选择一个颜色，它将更改选项卡的下划线颜色。

### 4.20 代码缩进着色

[indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)

安装此插件后，代码的每级缩进都会有不同的颜色，便于区分代码块。

安装此插件即可，不需要进行任何配置。你也可以自己修改缩进的颜色，看介绍文档配置。

### 4.21 Settings Sync: 同步vscode设置及扩展配置

[Settings Sync](https://segmentfault.com/a/1190000020894066)

实现同步的功能主要依赖于VSCode插件[“Settings Sync”](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync&ssr=false#overview)。它是基于 GitHub Tokens 和 GitHub Gist 功能实现，可以一键轻松实现上传下载跨多台机器同步设置、代码片段、主题、文件图标、启动、键绑定、工作区和扩展。

配置存在：https://gist.github.com/   

### 4.22 Path Intellisense:路径只能提示

[Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)

加入此插件让我们在应用文件（例如图片）时，有智能的路径提示。

### 4.23 HTML CSS Support: html中css类补全

[HTML CSS Support](https://marketplace.visualstudio.com/items?itemName=ecmel.vscode-html-css)

补充了VSCode中缺少的CSS支持。类属性补全、ID属性补全和全文件搜索CSS和SCSS提示等。

### 4.24 代码翻译：翻译(英汉词典)

[翻译(英汉词典)](https://marketplace.visualstudio.com/items?itemName=CodeInChinese.EnglishChineseDictionary)

英语不是很好的童鞋，在写代码的时候经常会使用“某道翻译”，但是其实对于代码来说，很多时候我们会用`驼峰`、`小驼峰`、`下划线`等等写法来写变量名、属性名、类名和方法名的。这种写法想使用“某道翻译”在编辑器中悬浮翻译就是不可能了。

找了很久我为大家找到一个非常好用的一个插件可以解决这个问题！

>   本地77万词条英汉词典，不依赖任何在线翻译API，无查询次数限制。可翻译驼峰和下划线命名，及对整个文件中的标识符批量翻译。

安装好后，在vscode底部的状态栏中会出现翻译

### 4.25 Code Spell Checker:英文单词拼写错误检查

[Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

一个基本的拼写检查器，可以检测驼峰写法。这个拼写检查程序的目标是帮助捕获常见的拼写错误。在编写代码的时候，我们都是用英文单词，很多时候我们都会写错单词的可能性。用错了单词其实对于维护性是有一定的影响的。

使用有意义的单词做为方法名、类名和变量名会给自己代码更多的意义和含义。当自己或者别人去查看代码时更容易懂其中的用意。但是如果我们拼错了单词，有些时候就无法理解这个单词是什么意思了。

所以这个插件对我们来说非常实用，就算是老外都非常多人在使用它。（目前有100多万下载量）

### 4.26 同步你的VSCode设置及扩展插件，换机不用愁

https://segmentfault.com/a/1190000020894066

### 4.27 AI编程工具：TONGYI Lingma

通义灵码最全使用指南：https://developer.aliyun.com/article/1605527

在vscode插件里面搜索：TONGYI Lingma。点击下载后，需要登陆账号，登陆阿里云的账号就可以



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

### 6.3 vue代码格式化方式不对

经过查找，发现`.vue`文件代码格式化时使用了[Vetur](https://marketplace.visualstudio.com/items?itemName=octref.vetur)形式，经过过查找，发现可使用Prettier来格式化代码，可以安装[Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)插件，然后在vscode编辑器会提示使用哪种工具来格式化代码，此时要选择Prettier，如果不小心还是选择了Vetur，那么可找到这个插件，然后先禁用掉，然后回到代码中，在格式化，编辑器会从新然呢选择格式化工具，此时可再次选择Prettier。

Prettier支持配置文件，在项目根目录下，`.prettierrc.js`:

```js
module.exports = {
  "semi":false,
  "singleQuote": true,
  "printWidth": 80
}
```

那么格式化会按照这个配置文件来做。

### 6.4 vue使用iView时标签报错 Parsing error: x-invalid-end-tag

```html
<Input class="cs-law-input"><span slot="append">法规</span></Input>
```

当使用iview中的Input标签时，报`Parsing error: x-invalid-end-tag.eslint-plugin-vue` 错误。

原因： iView将标签渲染为原生html标签时，由于这些标签是自闭合的，所以有end标签会报错。

解决方案：

修改eslint配置文件，添加一行：

```js
'vue/no-parsing-error': [2, { 'x-invalid-end-tag': false }],
```

如果还不行，尝试下面修改：

这是vetur中eslint的问题，在vscode菜单中，文件->首选项->设置， 找到 “vetur.validation.template”: true 将其改为false，就可关闭eslint的检查，错误消失。

参考资料：[vscode 解决 iview 报错](https://blog.csdn.net/jiaqingge/article/details/80498536?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-2.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromBaidu-2.control)

### 6.5 Could not create temporary directory: Permission denied

当点击vscode的`Check for Updates`选项来升级软件时，在编辑器的右下角出现了提示：

```bash
Could not create temporary directory: Permission denied
```

发现由于没有权限，导致升级失败，经过查找使用如下命令删除两个vscode的临时文件即可：

```bash
sudo rm -Rf ~/Library/Caches/com.microsoft.VSCode.ShipIt
sudo rm -Rf ~/Library/Caches/com.microsoft.VSCodeInsiders.ShipIt
```

在输入管理员密码后，在执行更新就发现没问题了。

### 6.6 安装离线插件失败，有兼容性问题

当安装离线插件的时候，会报如下错误：

![](./img/044-mac-vscode.png)

```bash
Unable to install extension 'eamodio.gitlens'as it is not compatible with VS Code '1.52.1'.
```

经过尝试，安装插件的历史版本也会报同样的错误。

解决方法：卸载vscode，安装最新版本的vscode软件后，在安装离线插件就能成功安装了。

### 6.7 Prettier格式化vue中html代码问题

 在使用Prettier格式化vue中的html代码的时候，标签结束符号会单独到一行中，经过查找资料，发现需要在Prettier配置文件中添加：

```js
module.exports = {
  // "singleQuote": true, // 字符串使用 单引号
  "printWidth": 100, // 每行最多 100个字符
  "htmlWhitespaceSensitivity": "ignore" // 解决html中元素标签结束标志(>)单独一行问题
}
```

https://zhuanlan.zhihu.com/p/64627216

##  其他插件资料

https://zhuanlan.zhihu.com/p/27905838

[vscode 插件推荐 - 献给所有前端工程师  segmentfaul](https://segmentfault.com/a/1190000006697219)





