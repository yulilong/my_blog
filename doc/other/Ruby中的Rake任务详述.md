http://wenku.baidu.com/link?url=tLW8V7LpI66Z7jRd_HkqGkXi-qNTZYr11_FZ6b0lt9qf7lHMQtO5eWbQqJ4K87eFcrGZ2IAm-7oG3gzI4-_XZs2gpVdY-pODVFL8sXfCZsq
```
﻿Rake简介

Rake和Make及Ant

Rake的意思是Ruby Make，一个用ruby开发的代码构建工具。Rake的英文意思是耙子，一种很朴实的劳动工具。真的是很贴切，Rake正是一个功能强大、勤勤恳恳的劳动工具。


但是，为什么Ruby需要Rake？


Ruby代码不需要编译，为什么需要Rake？其实，与其说Rake是一个代码构建工具，不如说Rake是一个任务管理工具，通过Rake我们可以得到两个好处：


以任务的方式创建和运行脚本

当然，你可以用脚本来创建每一个你希望自动运行的任务。但是，对于大型的应用来说，你几乎总是需要为数据库迁移（比如Rails中db:migrate任务）、清空缓存、或者代码维护等等编写脚本。对于每一项任务，你可能都需要写若干脚本，这会让你的管理变得复杂。那么，把它们用任务的方式整理到一起，会让管理变得轻松很多。


追踪和管理任务之间的依赖

Rake还提供了轻松管理任务之间依赖的方式。比如，“migrate”任务和“schema：dump”任务都依赖于 “connect_to_database”任务，那么在“migrate”任务调用之前，“connect_to_database”任务都会被执行。

在哪里可以获得Rake？

Rake的主页是在http://rake.rubyforge.org/，在这里你可以获得Rake的简单介绍，API以及一些有用文档的链接。可以在http://rubyforge.org/frs/?group_id=50获得最新版的Rake，在作者写作时，最新版本是0.7.3。
Rake脚本编写
一个简单脚本

Rake的脚本相当简单，下面用一个例子进行说明。假设你是一个勤劳的家庭型程序员，在周末你打算为你的家人做一些贡献。所以你为自己制定了三个任务：买菜、做饭和洗衣服。打开你的文本编辑器，创建一个名叫rakefile的文件（Rake会在当前路径下寻找名叫Rakefile、rakefile、RakeFile.rb和rakefile.rb的rake文件），并输入如下内容：

desc "任务1 -- 买菜"
 task :purchaseVegetables do
 puts "到沃尔玛去买菜。"
 end

 desc "任务2 -- 做饭"
 task :cook do
 puts "做一顿香喷喷的饭菜。"
 end

 desc "任务3 -- 洗衣服"
 task :laundry do
 puts "把所有衣服扔进洗衣机。"
 end



打开命令行工具，进入这个文件所在目录，然后运行下面的命令，大致应该类似如下结果：

D:\work\ruby_works\ruby_book>rake purchaseVegetables
 (in D:/work/ruby_works/ruby_book) 
到沃尔玛去买菜。

 D:\work\ruby_works\ruby_book>rake cook
 (in D:/work/ruby_works/ruby_book) 
做一顿香喷喷的饭菜。

 D:\work\ruby_works\ruby_book>rake laundry
 (in D:/work/ruby_works/ruby_book) 
把所有衣服扔进洗衣机。



分析

很简单，也很易读，对吧。这个文件一共定义了3个任务，desc是Rake定义的方法，表示对下面定义任务的描述。这个描述会在使用Rake --tasks（或者Rake -T，为懒人准备的快捷方式）命令时输出在屏幕上。

D:\work\ruby_works\ruby_book>rake --tasks
 (in D:/work/ruby_works/ruby_book) 
 rake cook # 任务2 -- 做饭
 rake laundry # 任务3 -- 洗衣服
 rake purchaseVegetables # 任务1 -- 买菜



下面的语句定义了purchaseVegetables这个任务，task是Rake最重要的方法。它的方法定义是：task(args, &block)。任务体是一个block，本例中只是简单输出你所要做的工作。需要注意的是代码

puts "到沃尔玛去买菜。"

完全是一个普通的Ruby语句，puts是Ruby中进行输出的一般性方法，可以看出，Rake任务可以完全使用Ruby的能力，这使得它非常强大。
加入依赖关系

很显然，在我们定义的任务中，做饭是依赖于买菜的（我相信大多数程序员在周末的冰箱里除了可乐没有别的）。那么，我们需要在我们的任务定义中加入这个依赖关系，修改后的文件如下：

desc "任务1 -- 买菜"
 task :purchaseVegetables do
 puts "到沃尔玛去买菜。"
 end

 desc "任务2 -- 做饭"
 task :cook => :purchaseVegetables do
 puts "做一顿香喷喷的饭菜。"
 end

 desc "任务3 -- 洗衣服"
 task :laundry do
 puts "把所有衣服扔进洗衣机。"
 end



再次运行做饭任务，你会得到如下结果：

D:\work\ruby_works\ruby_book>rake cook
 (in D:/work/ruby_works/ruby_book) 
到沃尔玛去买菜。
做一顿香喷喷的饭菜。



是的，你当然需要先买菜，谁让你是一个冰箱空空如野的程序员呢。
命名空间

跟任何编程语言类似，当你的rake文件很多时，当你有很多任务的时候，你需要关注它们的命名冲突问题，命名空间（namespace）就是一个自然的解决方案。你可以为上面的三个任务定义一个叫做home的命名空间。

namespace :home do
 desc "任务1 -- 买菜"
 task :purchaseVegetables do
 puts "到沃尔玛去买菜。"
 end
 ……
end



再次运行rake --tasks，你会得到如下的结果：

D:\work\ruby_works\ruby_book >rake --tasks
 (in D:/work/ruby_works/ruby_book) 
 rake home:cook # 任务2 -- 做饭
 rake home:laundry # 任务3 -- 洗衣服
 rake home:purchaseVegetables # 任务1 -- 买菜



你现在需要使用rake home:cook才能启动做饭这个任务了。当然，你可以在你的rakefile中使用多个命名空间，对任务进行分类。
在一个任务中调用另外一个任务

当任务众多的时候，你很可能需要在一个任务中调用另外一个任务，假设我们把今天所有要做的工作定义为一个任务：today。在这个任务中，有两个任务需要被调用，一个是做饭，一个是洗衣服。当然，由于做饭依赖于买菜，我们还是需要买菜的（这一步是逃不过去的，呵呵）。在文件的顶部定义一个today的任务：

desc "今天的任务"
 task :today do
 Rake::Task["home:cook"].invoke
 Rake::Task["home:laundry"].invoke
 end

 namespace :home do
 ……
 end



可以看出，调用其它任务的方式很简单，只需要调用Rake::Task["task_name"].invoke 方法就可以了。在命令行中启动rake today，可以得到：

D:\work\ruby_works\ruby_book >rake today
 (in D:/work/ruby_works/ruby_book) 
到沃尔玛去买菜。
做一顿香喷喷的饭菜。
把所有衣服扔进洗衣机。


默认任务

可以为Rake增加一个默认任务，这样可以简单地用Rake命令来触发这个默认任务，在上面的rakefile中，我们可以用如下方式把“today”任务作为默认任务。

task :default => [:today]

然后调用直接在命令行中调用rake，可以得到跟调用rake today同样的输出结果。

这就是我们简单的一个Rake任务定义，下面是完整的修改后的rakefile：

task :default => [:today] 

 desc "今天的任务"
 task :today do
 Rake::Task["home:cook"].invoke
 Rake::Task["home:laundry"].invoke
 end

 namespace :home do

 desc "任务1 -- 买菜"
 task :purchaseVegetables do
 puts "到沃尔玛去买菜。"
 end

 desc "任务2 -- 做饭"
 task :cook => :purchaseVegetables do
 puts "做一顿香喷喷的饭菜。"
 end

 desc "任务3 -- 洗衣服"
 task :laundry do
 puts "把所有衣服扔进洗衣机。"
 end
 end


Rails中的Rake任务

Rails预定义了大量的Rake任务，在Rails应用的开发过程中，你想必已经在大量使用它们了。在Rails中，所有的Rake任务都放在rails目录的lib/tasks目录下（在作者的环境下是c:\ruby\lib\ruby\gems\1.8\gems\rails-1.1.4\lib\tasks\），所有的rake任务都以.rake作为后缀名，这些以.rake结尾的文件会被自动加载到你的环境中。你可以到一个已有的Rails工程根目录下键入rake --tasks，可以看到很多的rake任务已经为你整装待发了。

在Rails中，最常使用的Rake任务之一是进行数据库的迁移（migration）。数据库迁移程序允许你使用Ruby脚本来定义数据库模式，而db:migrate就是进行这个工作的rake任务。下面我们来分析这个rake任务。

db:migrate任务

db:migrate任务存放在lib/tasks/databases.rake文件中。这个文件中定义了所有与数据库操作相关的任务，我们仅仅抽出db:migrate的定义：

namespace :db do
 desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
 task :migrate => :environment do
 ActiveRecord::Migrator.migrate("db/migrate/", ENV["VERSION"] ? ENV["VERSION"].to_i : nil) 
 Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
 end
 ……
 end




分析

首先是命名空间的声明，migrate任务的命名空间是db。这也就是我们用db:migrate来引用它的原因。

下面是一个描述，说明该任务的功能是把定义在db/migrate目录下（相对于你的Rails应用程序的根目录）的迁移脚本迁移到数据库中，如果不指定VERSION的话，默认是最新版本，否则可以恢复到一个指定的版本。

接着是任务的定义，该任务依赖于enviroment任务，这个任务在misc.rake中定义，用来加载Rails的环境，它的定义相当简单：

task :environment do
 require(File.join(RAILS_ROOT, 'config', 'environment')) 
 end


用来加载config/environment.rb文件，该文件会加载Rails工作所需要加载的环境。由于加载了这个环境，所以ActiveRecord对象现在可以使用，下面就是调用ActiveRecord::Migrator.migrate方法对每个db/migrate/下的脚本文件进行迁移。 

最后会调用db:schema:dump任务，该任务的主要作用是产生db/schema.rb文件。该文件用来记录不同版本的数据库模式。这个任务的定义就在db:migrate任务下面不远的地方，有兴趣的读者可以自行进行分析。
```
