http://www.jb51.net/article/81476.htm
```
Rake简介
Rake的意思是Ruby Make,一个用ruby开发的代码构建工具.
但是,为什么Ruby需要Rake?
    按理说Ruby代码无需编译,应该不需要Rake才对呀?原来,Rake另有妙用,即把Rake当做一个任务管理工具来使用...这样做有两个好处:
1.以任务的方式创建和运行脚本
   当然,你可以用脚本来创建每一个你希望自动运行的任务.但是,对于大型的应用来说,你几乎总是需要为数据库迁移(比如Rails中db:migrate任务)、清空缓存、或者代码维护等等编写脚本.对于每一项任务,你可能都需要写若干脚本,这会让你的管理变得复杂.那么,把它们用任务的方式整理到一起,会让管理变得轻松很多.
2.追踪和管理任务之间的依赖
Rake还提供了轻松管理任务之间依赖的方式.比如,"migrate"任务和"schema:dump"任务都依赖于 "connect_to_database"任务,那么在"migrate"任务调用之前,"connect_to_database"任务都会被执行.
下面入正题吧,即如何用Rake编写一个任务脚本..
顺序执行
在Rake中定义任务后，可以指定任务的执行顺序，例如，每天早晨起床后的例行公事:
1. 关闭闹钟
2. 梳洗打扮
3. 泡杯咖啡
4. 遛狗
上面的几项事物，在Rakefile中这样描述
task :turn_off_alarm do
 puts "Turned off alarm. Would have liked 5 more minutes, though."
end
 
task :groom_myself do
 puts "Brushed teeth."
 puts "Showered."
 puts "Shaved."
end
 
task :make_coffee do
 cups = ENV["COFFEE_CUPS"] || 2
 puts "Made #{cups} cups of coffee. Shakes are gone."
end
 
task :walk_dog do
 puts "Dog walked."
end
 
task :ready_for_the_day => [:turn_off_alarm, :groom_myself, :make_coffee, :walk_dog] do
 puts "Ready for the day!"
end

通过rake ready_for_the_day来执行任务，然后你就可以看到，所有的task都在按照你预定的顺序在执行。
Turned off alarm. Would have liked 5 more minutes, though.
Brushed teeth.
Showered.
Shaved.
Made 5 cups of coffee. Shakes are gone.
Dog walked.
Ready for the day!

此外还可以用过rake make_coffee COFFEE_CUPS=5这样在命令中给变量赋值。
命名空间
上面那样定义任务没有问题，但如果你需要另外定义些事物，比如工作相关的，交通相关的，这时候所有的任务混杂到一起显然就不合适了，毕竟上面那些任务只是我们起床的例行事物，与其它无关。
通过namespace可以帮助我们定义出Rails中类似rake db:migrate的任务，描画出事物间清晰的边界，将上面的任务包括在namespace的一个代码块中，如下
namespace :morning do
 task :turn_of_alarm
 ....
end

这一次我们的调用命令就需要稍微做出些许变化，rake COFFEE_CUPS=3 morning:ready_for_the_day。 是不是跟rails中的rake任务调用方式很像呢？
默认Task
有了上面那些设置，如果我们忘记或者不想写详细的任务名称，直接执行rake会有什么效果呢，结果是rake aborted!,任务被中断的报错。既然有这样的可能性，我们就需要消除这些隐患，通过设置default默认任务就可以做到，如下:
task :default => 'morning:turn_off_alarm'

当你直接执行rake命令时，会执行默认操作，帮我们关闭闹钟。
描述你的Task
当任务渐渐变多以后，管理问题就暴露出来了，除了命名空间以外，我们还需要文档类的支持，帮助我们梳理任务并显示的告诉我们每个任务的目的和功能，这时你可以试一试用desc描述任务。
...
desc "Make coffee"
task :make_coffee do
 cups = ENV["COFFEE_CUPS"] || 2
 puts "Made #{cups} cups of coffee. Shakes are gone."
end
...

上面的描述不仅可以在文档中查看，同时使用rake -T也能清洗的了解到每个任务是做什么的。rake -T的输出结果是按照字母顺序排的序。
rake morning:make_coffee    # Make coffee

调取Task
Rake还允许在不同任务之间互相调用，例如下面的代码,你想在下午也来杯咖啡，不用重复定义，直接使用上午的泡法，来一杯即可。
namespace :afternoon do
  task :make_coffee do
   Rake::Task['morning:make_coffee'].invoke
   puts "Ready for the rest of the day!"
  end
 end

Rake脚本编写
先来个简单的例子,如下:
假设你是一个火星成员,老版本那些,即如燕儿虎跑之类的,在周末你打算去车车那边打火锅,然后集体PC去.对应这个情况,你需要为自己制定三个任务:搭车找车车、烤鱼和网吧PC.用vim创建创建一个名叫rakefile的文件(备注:Rake会在当前路径下寻找名叫Rakefile、rakefile、RakeFile.rb和rakefile.rb的rake文件),并键入如下代码:
desc "任务1 -- 搭车去车车那里"#这据说是个苦差,因为太远了 
task :busboy do
puts "发现挫男"
end
  
desc "任务2 -- 烤鱼"
task :bitchfish do
puts "老板,先烤九斤鱼"
end
  
desc "任务3 -- 网吧PC"
task :pc do
puts "我选中路"
end

打开命令行工具,进入这个文件所在目录,然后运行下面的命令,大致应该类似如下结果:
D:\work>rake busboy 
(in D:/work) 
发现挫男 
  
D:\work>rake bitchfish 
(in D:/work) 
老板,先烤九斤鱼 
  
D:\work\ruby_works\ruby_book>rake laundry 
(in D:/work) 
我选中路 

(备注:文字部分是没啥逻辑的,纯粹娱乐下...)
分析：
相信看完上面那段东东,你已经知道怎么搞了...现在介绍些基础知识,方便加深理解.从上面的代码可以知道,此文件一共定义了3个任务,desc是Rake定义的方法,表示对下面定义任务的描述.这个描述会在使用Rake --tasks(或者Rake -T)命令时输出在屏幕上.
D:\work>rake --tasks
(in D:/work) 
rake bitchfish #任务2 -- 烤鱼 
rake busboy #任务1 -- 搭车去车车那里(这据说是个苦差,因为太远了) 
rake pc 任务3 -- 网吧PC 

task是Rake最重要的方法.它的方法定义是:task(args, &block).任务体是一个block,本例中只是简单输出你所要做的工作.需要注意的是代码
puts "发现挫男"

完全是一个普通的Ruby语句,puts是Ruby中进行输出的一般性方法,可以看出,Rake任务可以完全使用Ruby的能力,这使得它非常强大.
go..go..go..go..
接下来加入依赖关系：
很显然,在我们定义的任务中,"烤鱼"是依赖于"搭车去车车那里"的(其它地方有没烤鱼吃不知道,反正地点就定在那了).那么,我们需要在我们的任务定义中加入这个依赖关系,修改后的文件如下:
desc "任务1 -- 搭车去车车那里"
task :busboy do
puts "发现挫男"
end
  
desc "任务2 -- 烤鱼"
task :bitchfish => :busboy do
puts "老板,先烤九斤鱼"
end
  
desc "任务3 -- 网吧PC"
task :pc do
puts "我选中路"
end

再次运行烤鱼任务,你会得到如下结果: 
D:\work>rake bitchfish 
(in D:/work) 
发现挫男 
老板,先烤九斤鱼 
加入命名空间：
跟任何编程语言类似,当你的rake文件很多时,当你有很多任务的时候,你需要关注它们的命名冲突问题,命名空间(namespace)就是一个自然的解决方案.你可以为上面的三个任务定义一个叫做dan的命名空间.
namespace :dan do
desc "任务1 -- 搭车去车车那里"
task :busboy do
puts "发现挫男"
end
…… 
end

再次运行rake --tasks,你会得到如下的结果:
D:\work >rake --tasks 
(in D:/work) 
rake dan:bitchfish # 任务2 -- 烤鱼 
rake dan:pc # 任务3 -- 网吧PC 
rake dan:busboy # 任务1 -- 搭车去车车那里 

你现在需要使用rake dan:bitchfish才能启动烤鱼这个任务了. 
(BTW,你可以在你的rakefile中使用多个命名空间,对任务进行分类.)
了解了上面两个知识点后,我们来了解下两个具体实例:
1.在一个任务中调用另外一个任务
当任务众多的时候,你很可能需要在一个任务中调用另外一个任务,假设我们把今天所有要做的工作定义为一个任务:today.在这个任务中,有两个任务需要被调用,一个是烤鱼,一个是网吧PC.当然,由于烤鱼依赖于搭车去车车那里,我们还是需要搭车去车车那里的.在文件的顶部定义一个today的任务:
desc "今天的任务"
task :today do
Rake::Task["dan:bitchfish"].invoke 
Rake::Task["dan:pc"].invoke 
end
  
namespace :dan do
…… 
end

可以看出,调用其它任务的方式很简单,只需要调用
Rake::Task["task_name"].invoke 

方法就可以了.在命令行中启动rake today,可以得到:
D:\work >rake today 
(in D:/work) 
发现挫男 
老板,先烤九斤鱼 
我选中路 

2.默认任务：
可以为Rake增加一个默认任务,这样可以简单地用Rake命令来触发这个默认任务,在上面的rakefile中,我们可以用如下方式把"today"任务作为默认任务.

task :default => [:today] 

然后调用直接在命令行中调用rake,可以得到跟调用rake today同样的输出结果.
这就是我们简单的一个Rake任务定义,下面是完整的修改后的rakefile:

task :default => [:today] 
  
desc "今天的任务"
task :today do
 Rake::Task["dan:bitchfish"].invoke 
 Rake::Task["dan:pc"].invoke 
end
  
namesoace :dan do
 desc "任务1 -- 搭车去车车那里(这据说是个苦差,因为太远了)"
 task :busboy do
  puts "发现挫男"
 end
  
 desc "任务2 -- 烤鱼"
 task :bitchfish do
  puts "老板,先烤九斤鱼"
 end
  
 desc "任务3 -- 网吧PC"
 task :pc do
  puts "我选中路"
 end
end
看完上面两个例子,估计rake任务就算全部了解了...其它都是些代码枪花罢了..多耍便是..
```