* **haml中一些符号的作用**

* **%**    
百分号符号是一行的开始，紧接着一个元素的名字，然后后面跟一个可选的修饰语（见下例），比如一个空格，或一行文本等，就会被渲染到这个元素里成为其内容。它会创建一个这样的形式：<element></element>.      

* **{}**     
括号内的Ruby hash是用来指名一个元素的属性。它作为一个ruby hash的字面量，局部变量也可以在其中使用。Hash放在被定义好的标签之后，基本上就和Ruby语法一样，看例子：      

* **[]**     
方括号跟在一个标签定义之后，包含一个Ruby 对象，被用来为这个标签设置class和id属性。这个class的值被设置为这个对象的类名（两个单词用下划线形式表示，而不是驼峰表示方法）并且id的值被设置为对象的类名加上这个对象的id，也是下划线连接。因为一个对象的id通常是朦胧的实现细节，这是表现model的实例最有用的元素了（这句是不是翻译的太差？）。         

* **/**      
这个斜线字符，放在一个tag定义之后，可以让这个标签自我关闭。       

* **. and #**      
这两个符号是从CSS里借鉴来的。他们被用来表示一个元素的class和id属性        

* **Implicit Div Elements（隐藏DIV）**      
因为Div这个标签经常被用，所以你仅用.and#这两个符号来定义class和id的时候，一个div元素就会被自动的使用。     

* **=**      
等号符号用来插入ruby 代码的值到模板中。    

* **!!!**     
当用haml来表示一个XHTML文档，你可以通过!!!这个符号来自动生成文档类型和XML prolog。

* **/**     
如果这个斜线写在打头的位置，则会注释这行。       
放在代码的上方，则注释整个代码：     

* **\**       
反斜杠符号允许字符串前面的第一个符号作为纯文本使用。    

* **|**      
管道符可以允许把输出为一行的内容写成多行。     

* **:**     
冒号是指定一个过滤器。冒号后面是你要使用的那个过滤器的名字。

* **-**
横杠符号，很有性格，可以使文本变为”silent script”：意思是，代码可以执行，但并不输出任何东西。     


* **Blocks**     
Ruby中的块，也不需要明显的去关闭，haml会让它自动关闭。这写都是基于缩进的。千万记住要缩进两个空格。  

----------
* **%**    
百分号符号是一行的开始，紧接着一个元素的名字，然后后面跟一个可选的修饰语（见下例），比如一个空格，或一行文本等，就会被渲染到这个元素里成为其内容。它会创建一个这样的形式：<element></element>.
```
式：<element></element>.。举个例子：
  %one
    %two
      %three Hey there
会被编译为：
  <one>
    <two>
      <three>Hey there</three>
    </two>
  </one>
对于任何一个有效的标准元素字符，Haml都会自动的为其生成闭合标签。
```     

* **{}**     
括号内的Ruby hash是用来指名一个元素的属性。它作为一个ruby hash的字面量，局部变量也可以在其中使用。Hash放在被定义好的标签之后，基本上就和Ruby语法一样，看例子：      
```
%head{ :name => "doc_head" }
    %script{ 'type' => "text/" + "javascript",
             :src   => "javascripts/script_#{2 + 7}" }
编译后为：
  <head name="doc_head">
    <script src='javascripts/script_9' type='text/javascript'>
    </script>
  </head>
```     

* **[]**     
方括号跟在一个标签定义之后，包含一个Ruby 对象，被用来为这个标签设置class和id属性。这个class的值被设置为这个对象的类名（两个单词用下划线形式表示，而不是驼峰表示方法）并且id的值被设置为对象的类名加上这个对象的id，也是下划线连接。因为一个对象的id通常是朦胧的实现细节，这是表现model的实例最有用的元素了（这句是不是翻译的太差？）。看例子：      
```
# file: app/controllers/users_controller.rb
  def show
    @user = CrazyUser.find(15)
  end
 # file: app/views/users/show.haml
  %div[@user]
    %bar[290]/
    Hello!
转换为：
  <div class="crazy_user" id="crazy_user_15">
    <bar class="fixnum" id="fixnum_581" />
    Hello!
  </div>
这是基于RailsConf Europe 2006 大会上DHH提出的SimpleHelpful语法
```      

* **/**      
这个斜线字符，放在一个tag定义之后，可以让这个标签自我关闭。例子：      
```
 %br/
  %meta{'http-equiv' => 'Content-Type', :content => 'text/html'}/
转换为：
  <br />
  <meta http-equiv='Content-Type' content='text/html' />
有一些标签（meta, img, link, script, br, and hr tags等）当没有内容的时候会自动关闭。看例子：
  %br
  %meta{'http-equiv' => 'Content-Type', :content => 'text/html'}
转换为：
  <br />
  <meta http-equiv='Content-Type' content='text/html' />
```      

* **. and #**      
这两个符号是从CSS里借鉴来的。他们被用来表示一个元素的class和id属性,看例子：
```
%div#things
    %span#rice Chicken Fried
    %p.beans{ :food => 'true' } The magical fruit
    %h1.class.otherclass#id La La La
转换为：
 
  <div id='things'>
    <span id='rice'>Chicken Fried</span>
    <p class='beans' food='true'>The magical fruit</p>
    <h1 class='class otherclass' id='id'>La La La</h1>
  </div>
注意h1标签。两个点连用，第一个表示class属性，第二个则是用来链接那两个字符的空格。
```    

* **Implicit Div Elements（隐藏DIV）**      
因为Div这个标签经常被用，所以你仅用.and#这两个符号来定义class和id的时候，一个div元素就会被自动的使用。例如：      
```
#collection
    .item
      .description What a cool item!
和下面的这个相似：
  %div{:id => collection}
    %div{:class => 'item'}
      %div{:class => 'description'} What a cool item!
都会被转换为：
  <div id='collection'>
    <div class='item'>
      <div class='description'>What a cool item!</div>
    </div>
  </div>
```      

* **=**      
等号符号用来插入ruby 代码的值到模板中。       
```
 %p
    = ['hi', 'there', 'reader!'].join " "
    = "yo"
编译为:
  <p>
    hi there reader!
    yo
  </p>
你也能使用双等号来更容易的嵌入ruby代码。比如：
  %p
    == 1 + 1 = #{1 + 1}
编译为：
  <p>
    1 + 1 = 2
  </p>
```     

* **!!!**     
当用haml来表示一个XHTML文档，你可以通过!!!这个符号来自动生成文档类型和XML prolog。比如：      
```
!!! XML
  !!!
  %html
    %head
      %title Myspace
    %body
      %h1 I am the international space station
      %p Sign my guestbook
转换为：
  <?xml version="1.0" encoding="utf-8" ?>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html>
    <head>
      <title>Myspace</title>
    </head>
    <body>
      <h1>I am the international space station</h1>
      <p>Sign my guestbook</p>
    </body>
  </html>


你也可以在！！！后面加版本号。比如：
  !!! 1.1
转换为：
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
and
 
  !!! Strict
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
如果你不想用UTF-8的编码，你也可以指定你想要的编码：
  !!! XML iso-8859-1
转换为：
  <?xml version="1.0" encoding="iso-8859-1" ?>
 
```      

* **/**     
如果这个斜线写在打头的位置，则会注释这行。       
放在代码的上方，则注释整个代码：     
```
%billabong
    / This is the billabong element
    I like billabongs!
转换为：
  <billabong>
    <!-- This is the billabong element -->
    I like billabongs!
  </billabong>
---------------------
/
    %p This doesn't render...
    %div
      %h1 Because it's commented out!
转换为：
 
  <!--
    <p>This doesn't render...</p>
    <div>
      <h1>Because it's commented out!</h1>
    </div>
  -->
```    

* **\**       
反斜杠符号允许字符串前面的第一个符号作为纯文本使用。      
```
 %title
    = @title
    \- MySite
转换为：
 
  <title>
    MyPage
    - MySite
  </title>
```

* **|**      
管道符可以允许把输出为一行的内容写成多行。     
```
 %whoo
    %hoo I think this might get |
      pretty long so I should |
      probably make it |
      multiline so it doesn't |
      look awful. |
    %p This is short.

is compiled to:
转换为：
 
  <whoo>
    <hoo>
      I think this might get pretty long so I should probably make it multiline so it doesn't look awful.
    </hoo>
  </whoo>
```

* **:**     
冒号是指定一个过滤器。冒号后面是你要使用的那个过滤器的名字。For example,      
```
%p
    :markdown
      Textile
      =======
      Hello, *World*
转换为：
  <p>
    <h1>Textile</h1>
    <p>Hello, <em>World</em></p>
  </p>

Haml支持的过滤器定义
plain
ruby
preserve
erb
sass
redcloth
textile
markdown
```    

* **-**
横杠符号，很有性格，可以使文本变为”silent script”：意思是，代码可以执行，但并不输出任何东西。     


* **Blocks**     
Ruby中的块，也不需要明显的去关闭，haml会让它自动关闭。这写都是基于缩进的。千万记住要缩进两个空格。     
```
- (42...47).each do |i|
    %p= i
  %p See, I can count!
编译为:
 
  <p>
    42
  </p>
  <p>
    43
  </p>
  <p>
    44
  </p>
  <p>
    45
  </p>
  <p>
    46
  </p>
```
上面的语法出自： http://blackanger.blog.51cto.com/140924/47642/


##haml官网
http://haml.info/

##Haml 参考大全
http://blackanger.blog.51cto.com/140924/47642/

##简明教程
http://www.codeweblog.com/%E7%BF%BB%E8%AF%91-haml%E5%AE%98%E7%BD%91%E7%AE%80%E6%98%8E%E6%95%99%E7%A8%8B/

## 入门
http://www.2cto.com/kf/201601/485095.html