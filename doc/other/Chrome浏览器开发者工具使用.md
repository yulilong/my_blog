[TOC]

###  1. 打开chrome的开发者工具

网页右键 -> 最下面的'检查'，就能调出开发者工具

- 直接按`Option + Command + J`（Mac）或者`Ctrl + Shift + J`（Windows / Linux）。
- Chrome菜单-> View -> Developer - > Developer Tools, 或者`Option + Command + I`（Mac）以及`Ctrl + Shift + I`（Windows / Linux）。

http://javascript.ruanyifeng.com/introduction/intro.html#toc10

### 2. Console部分的使用

#### 2.1 直接使用标签的ID名字即可调出该标签的dom

如`<div id="app">123</div>`，可直接输入`app`即可查看该标签的dom

#### 2.1 页面跳转后，输出的console记录保留

点击右边齿轮图标，然后选择`preserve log`

然后在切换页面后，所有输出的log记录都会保留。

### 3. 利用开发者工具截取页面

#### 3.1 截取整个页面：Capture full size screenshot

1. 打开 Chrome 浏览器，进入需要截图的网站页面
2. 等待页面加载完毕后，通过下面方法打开开发者工具：在页面任何地方点击鼠标右键，在弹出菜单中选择“检查（Inspect）”选项。或者使用快捷键组合：`Alt` + `Command` + `I` (Mac) 或 `Ctrl` + `Shift` + `I` (Windows)
3. 使用快捷键组合来打开命令行（command palette）：`Command` + `Shift` + `P` (Mac) 或 `Ctrl` + `Shift` + `P` (Windows)
4. 在命令行中输入“Screen”，这时自动补齐功能会显示出一些包含 "Screen" 关键字的命令。移动方向键到“Capture full size screenshot”并回车（或直接用鼠标点击这个选项）

参考资料：https://weibo.com/ttarticle/p/show?id=2309404241869646237445

#### 3.2 截取页面中的一些元素

1. 进入需要截图的网站页面，打开开发者工具（方法和上面两步相同）
2. 点击开发者工具左上角的“选取元素”按钮，在网页中点击要截图的元素
3. 由于 HTML 父子元素的嵌套，可能选中的是需要截图元素的子元素。这时，需要在开发者工具中对所选取的元素进行调整：由于选取的是子元素，所以只需要在“选取元素”按钮，旁边的"Elements Tab"里边按照嵌套关系，找到合适的父元素就可以了。这时，点击选中该父元素。
4. 打开命令行，进行截图命令（方法和上面第四步类似）。不过需要注意这时在包含 "Screen" 关键字的命令中选取“Capture node screenshot”



