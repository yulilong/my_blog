# Welcome
## centos7 
* [linux terminal command](https://bitbucket.org/yulilong/my_wiki/wiki/linux%20terminal%20command)
* [centos7 搭建samba方法](https://bitbucket.org/yulilong/my_wiki/wiki/centos7%20%E6%90%AD%E5%BB%BAsamba%E6%96%B9%E6%B3%95)
* [ cento7 错误处理](https://bitbucket.org/yulilong/my_wiki/wiki/cento7%20%E9%94%99%E8%AF%AF%E5%A4%84%E7%90%86)
* [centos7,rvm,ruby,gems,rails,pqadmin3,rubymine,isntall](https://bitbucket.org/yulilong/my_wiki/wiki/centos7,rvm,ruby,gems,rails,pqadmin3,rubymine,isntall)
* [centos7_install_stardict](https://bitbucket.org/yulilong/my_wiki/wiki/centos7_install_stardict)
* [git_setup](https://bitbucket.org/yulilong/my_wiki/wiki/git_setup)
* [virtualbox虚拟机 centos7安装增强工具](https://bitbucket.org/yulilong/my_wiki/wiki/virtualbox%E8%99%9A%E6%8B%9F%E6%9C%BA%20centos7%E5%AE%89%E8%A3%85%E5%A2%9E%E5%BC%BA%E5%B7%A5%E5%85%B7)

##ruby rails 学习资料

* [Ruby on Rails 在线教程](https://railstutorial-china.org/book/)


* [Rails 中文指南](http://guides.ruby-china.org/)
* [Rails 官网](http://rubyonrails.org/)
* [rubygems 官网](https://rubygems.org/)

* [ruby_or_rails_错误解决](https://bitbucket.org/yulilong/my_wiki/wiki/ruby_or_rails_%E9%94%99%E8%AF%AF%E8%A7%A3%E5%86%B3)
* [ruby中语法、知识](https://bitbucket.org/yulilong/my_wiki/wiki/ruby%E4%B8%AD%E8%AF%AD%E6%B3%95%E3%80%81%E7%9F%A5%E8%AF%86)
### rake
* [Ruby中任务构建工具rake的入门学习教程](https://bitbucket.org/yulilong/my_wiki/wiki/Ruby%E4%B8%AD%E4%BB%BB%E5%8A%A1%E6%9E%84%E5%BB%BA%E5%B7%A5%E5%85%B7rake%E7%9A%84%E5%85%A5%E9%97%A8%E5%AD%A6%E4%B9%A0%E6%95%99%E7%A8%8B)          推荐读这个，简单易懂。
* [Ruby on Rails中的Rake教程](https://bitbucket.org/yulilong/my_wiki/wiki/%20Ruby%20on%20Rails%E4%B8%AD%E7%9A%84Rake%E6%95%99%E7%A8%8B)
* [Ruby中的Rake任务详述](https://bitbucket.org/yulilong/my_wiki/wiki/Ruby%E4%B8%AD%E7%9A%84Rake%E4%BB%BB%E5%8A%A1%E8%AF%A6%E8%BF%B0)

###rails -> view
* [rails中view 部分haml资料](https://bitbucket.org/yulilong/my_wiki/wiki/rails%E4%B8%ADview%20%E9%83%A8%E5%88%86haml%E8%B5%84%E6%96%99)


###rails -> route
* [rails中route官方教程](http://guides.ruby-china.org/routing.html)http://guides.ruby-china.org/routing.html

要想查看程序完整的路由列表，可以在开发环境中使用浏览器打开 http://localhost:3000/rails/info/routes    
也可以在终端执行 rake routes 任务查看，结果是一样的。
 



如果 .md里面要方图片，一种是把图片放到网易博客中去。
## Wiki features

This wiki uses the [Markdown](http://daringfireball.net/projects/markdown/) syntax. The [MarkDownDemo tutorial](https://bitbucket.org/tutorials/markdowndemo) shows how various elements are rendered. [Bitbucket documentation](https://confluence.atlassian.com/display/BITBUCKET/Use+a+wiki) has more information about how using a wiki.

The wiki itself is actually a git repository, which means you can clone it, edit it locally/offline, add images or any other file type, and push it back to us. It will be live immediately.

Go ahead and try:

```
$ git clone https://yulilong@bitbucket.org/yulilong/my_wiki.git/wiki
```

Wiki pages are normal files, with the .md extension. You can edit them locally, as well as creating new ones.

## Syntax highlighting


You can also highlight snippets of text (we use the excellent [Pygments][] library).

[Pygments]: http://pygments.org/


Here's an example of some Python code:

```
#!python

def wiki_rocks(text):
    formatter = lambda t: "funky"+t
    return formatter(text)
```


You can check out the source of this page to see how that's done, and make sure to bookmark [the vast library of Pygment lexers][lexers], we accept the 'short name' or the 'mimetype' of anything in there.
[lexers]: http://pygments.org/docs/lexers/


Have fun!
