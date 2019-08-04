http://blog.csdn.net/maowenbin/article/details/5539564
```
原文：http://jasonseifer.com/2010/04/06/rake-tutorial
引言：作为一个rails的开发者，你可能很熟悉使用rake进行你的测试，或者使用rake db:migrate运行你的migrations，但是你真的知道Rake的背后故事吗？你意识到可以自己写一个Rake任务或者一个有用的 lib吗 ？

下面是我们使用Rake任务的例子：

1、给列表中的用户发送邮件
2、每晚数据的计算和报告
3、过期或重新生成缓存
4、备份数据和svn版本(how's this : subversion repository )
5、运行数据处理脚本(sort of,how much is called this )
6、Pouring drinks to get a good buzz on(一句玩笑，是这两位仁兄的风格)

这篇文章中，我们将讨论为什么要创建Rake，和他怎么样帮助我们的rails应用。最好你可以写自己的Rake。

一、历史回顾：make

为了了解Rake的来历，我们先了解一下Rake的爷爷：Make。
让我们回到那个代码块需要编译，解释性语言和iphone还没出现在地球上的时代。

回到那时，我们下载的大型程序，还是一堆源代码和一个shell脚本。这个shell脚本包含了所有需要用来compile/link/build的代 码。你需要运行“install_me.sh”这个脚本，每一行代码将被运行（编译每一行源文件），然后生成一个你能够运行的文件。

对于大多数人这样是不错的，但是对于程序开发人员却是一个不幸。每次你对源代码进行一个小的改动，并进行测试的时候，你需要回到shell脚本，并重新编 译所有的源代码，显然对于大的程序“那是相当的”耗时的。

1977年（作者出生那年，我78年），贝尔实验室的Stuart Feldman创造了“make”。解决了编译时间过长的问题。Make用来编译程序，取得两方面的进步：

Stuart Feldman 

（1）Make可以发现哪个文件在上一次编译后改动过，根据这点，再次运行Make时，仅编译改动过的文件。这个很大程序上减少了重新编译大型程序的时 间。

（2）Make可以进行从属跟踪。你可以告诉编译器，源文件A的编译需要源文件B，源文件B的编译需要源文件C，所以Make在编译A时发现B没有编译， 将会先编译B。

可以这样定义：Make是一个可执行程序。像ls或dir一样。让Make理解如何让编译一个项目，需要创建一个makefile文件，描述所有的源文件 和依赖关系。makefiles有自己的语法，你不用去了解。

这些年Make出现了其他的变体，并且被其他的语言使用。事实上，ruby用户在rake出现前也在使用它。

“但是，ruby并不需要编译，我们用它来干嘛？”

是啊。ruby是一个解释性语言，我们不需要编译它的源代码，所以ruby程序员为什么使用它呢？

两个重要的原因：

（1）创建任务
在大型的应用中，你经常编写脚本，在命令行下运行一些任务。比如清除缓存，维护任务，或者迁移数据库。你可以写一个MakeFile来组织你的任务，而不 是写十个不相干的脚本（或者一个复杂的）。这样你可以简单的运行：“make stupid”。

（2）从属任务跟踪
当你开始写一些维护任务的时候，可能发现有些任务的使用可能有重复。比如，“migrate”任务和“schema:dump”都需要链接数据库，这样我 可以创建一个任务"connect_to_database"，使“migrate”和“schema:dump”都依赖 于"connect_to_database"，这样下次运行“migrate”时，"connect_to_database"会先于 “migrate”运行

二、如何得到Rake

几年前，Jim Weirich 在一个 Java项目上使用了Make，他发现如果在他的Makefile中写一小段ruby代码 将会带来非常大的方便。所以 他创建了Rake。


左：Jim Weirich，中：Jason Seifer，右：Gregg Pollack
（后面两位为本文作者）


Jim 为Rake创建了任务功能，附属关系跟踪，甚至创建了时间段判断(timestamp recognition)，（在上一次编译的基础上仅编译改动的部分），当然，对于ruby，我们并不需要编译。

我很想知道Jim在代码里做了什么，你也想知道吧。Jim可能从来没想给这个代码写个文档，可能现在他也是被烦透了，写了一个 。呵 呵


三、Rake如何工作

开始我想给这个部分起名为"How to get wasted with Rake"。

那么我想喝点酒，该怎么做呢？

1、去买酒
2、喝酒
3、喝醉



如果我要使用Rake完成这个任务，我会创建一个“Rakefile”文件：
task :purchaseAlcohol
 do
  puts "
Purchased Vodka
"
end

task :mixDrink
 do
  puts "
Mixed Fuzzy Navel
"
end

task :getSmashed
 do
  puts "
Dood, everthing's blurry, can I halff noth'r drinnnk?
"
end
这样我可以在这个Rakefile的目录，分别运行这些任务：

$
 rake purchaseAlcohol
 Purchased
 Vodka

$
 rake mixDrink
 Mixed
 Fuzzy
 Navel

$
 rake getSmashed
 Dood
, everthing'
s blurry, can I halff noth
'

r drinnnk?
酷！但是从顺序上看，我可以用任何的顺序运行这个任务。比如喝醉在买酒或者喝酒之前。当然这不符合人的习惯。


四、Rake的顺序

task :purchaseAlcohol
 do
  puts "
Purchased Vodka
"
end
task :mixDrink
 => :purchaseAlcohol
 do

  puts "
Mixed Fuzzy Navel
"
end

task :getSmashed
 => :mixDrink
 do
  puts "
Dood, everthing's blurry, can I halff noth'r drinnnk?
"
end
这样，如果想喝酒，就得先去买，如果想喝醉，就得先喝酒。

$
 rake purchaseAlcohol


 Purchased
 Vodka
$
 rake mixDrink        


 Purchased
 Vodka

 Mixed
 Fuzzy
 Navel

$
 rake getSmashed
 Purchased
 Vodka
 Mixed
 Fuzzy
 Navel

 Dood
, everthing'
s blurry, can I halff noth
'
r drinnnk?
看到了吧，我喝醉和，因为酒已经买了，也被我喝了。(译者：我是喜欢百事的，所以倘若我写，定然拿百事当例子。但是我让我儿子和可口，为什么呢？下面告诉 你。)

现在，你的欲望无法满足了，你想让你的朋友加入进来。就像一个团队的开发，如果你想加入一个新人，你得有合适的规划。你得有文档。那么问题来了。

五、如何给我的Rake添加文档

Rake添加文档非常的方便，使用“desc”就可以了：
desc "
This task will purchase your Vodka
"

task :purchaseAlcohol
 do
  puts "
Purchased Vodka
"
end

desc "
This task will mix a good cocktail
"
task :mixDrink
 => :purchaseAlcohol
 do
  puts "
Mixed Fuzzy Navel
"

end

desc "
This task will drink one too many
"

task :getSmashed
 => :mixDrink
 do

  puts "
Dood, everthing's blurry, can I halff noth'r drinnnk?
"

end
看到了吧，我的每个任务都添加了desc，这样我们可以输入"rake -T"或者"rake --tasks":

$rake
 --tasks

 rake getSmashed        # This task will drink one too many

 rake mixDrink          # This task will mix a good cocktail

 rake purchaseAlcohol  # This task will purchase your Vodka
简单乎？呵呵

六、Rake的命名空间

当你开始酗酒，并且开始使用大量的rake任务的时候，你需要一个好方法将他们分类，这时用到了命名空间，如果我在上面的例子使用了命名空间，那么：
namespace :alcoholic
 do

  desc "
This task will purchase your Vodka
"

  task :purchaseAlcohol
 do
    puts "
Purchased Vodka
"
 end

  desc "
This task will mix a good cocktail
"

  task :mixDrink
 => :purchaseAlcohol
 do

    puts "
Mixed Fuzzy Navel
"
  end
  desc "
This task will drink one too many
"

  task :getSmashed
 => :mixDrink
 do

    puts "
Dood, everthing's blurry, can I halff noth'r drinnnk?
"
  end
end
命名空间允许你将一些任务放到特定的分类中，在一个Rakefile中，你可以加入几个命名空间。运行rake --tasks
rake alcoholic:getSmashed
        # This task will drink one too many

rake alcoholic:mixDrink
          # This task will mix a good cocktail

rake alcoholic:purchaseAlcohol
  # This task will purchase your Vodka

所以如果想运行这个任务，只要输入 rake alcoholic:getSmashed：


七、如何写一个有用的ruby任务

最近，我想用ruby创建几个文件夹：

 desc "
Create blank directories if they don't already exist
"

task(:create_directories
) do

  # The folders I need to create

  shared_folders = ["
icons
"
,"
images
"
,"
groups
"

]

  for
 folder in
 shared_folders

    # Check to see if it exists

    if
 File
.exists?(folder)
      puts "
#{
folder}

 exists
"
    else

      puts "
#{
folder}

 doesn't exist so we're creating
"
      Dir
.mkdir "
#{
folder}

"
    end
  end
end

当然，还可以在rake中使用更多的 文件工具File Utils ， 或者加入其他的部分。


八、如何为我的rails应用写一个Rake任务

一个rails应用中，已经有了一些rake任务，你可以在你的项目目录里运行：rake --tasks。

为了给你的rails应用添加一个新的任务，你可以打开/lib/tasks目录（已经存在的），添加一个叫 something.rake的文 件，这个任务会被自动的检索到，这些任务会被添加到rake tasks列表中，你可以在根目录里运行他们，现在把我们上面的例子放到这个rails应用中。

utils.rake 

 namespace :utils
 do
  desc "
Create blank directories if they don't already exist
"
  task(:create_directories
) do
    # The folders I need to create
    shared_folders = ["
icons
"
,"
images
"
,"
groups
"
]

    for
 folder in
 shared_folders

      # Check to see if it exists
     if
 File
.exists?("
#{
RAILS_ROOT
}

/public/
#{
folder}

"

)


        puts "
#{
RAILS_ROOT
}

/public/
#{
folder}

 exists
"




      else



        puts "
#{
RAILS_ROOT
}

/public/
#{
folder}

 doesn't exist so we're creating
"

        Dir
.mkdir "
#{
RAILS_ROOT
}

/public/
#{
folder}

"

      end

    end

  end

end
注意上面的代码，我使用了#{RAILS_ROOT} 来得到rails应用的当前位置，现在运行“rake --tasks”，你可以看到我们的任务已经添加到tasks列表中了。
...

rake tmp:pids
:clear
              # Clears all files in tmp/pids

rake tmp:sessions
:clear
          # Clears all files in tmp/sessions

rake tmp:sockets
:clear
           # Clears all files in tmp/sockets

rake utils:create_directories
    # Create blank directories if they don't already exist

...

九、如何在任务中调用rails的model

呵呵，这个正是我最多使用rake的地方，写一个rake任务，代替原来需要手工操作的地方，或者一些任务代替经常需要按照计划自动执行（使用 cronjobs ） 的事情。就像我开头说的那样我用rake任务执行下面的擦作：

1、给列表中的用户发送邮件
2、每晚数据的计算和报告
3、过期或重新生成缓存
4、备份数据和svn版本(how's this : subversion repository )
5、运行数据处理脚本(sort of,how much is called this )

这个补充了原来的功能，而且相当简单。下面这个任务是检查用户的过期时间，对快过期的用户发送邮件。

utils.rake

 namespace :utils
 do

  desc "
Finds soon to expire subscriptions and emails users
"

  task(:send_expire_soon_emails
 => :environment
) do

        # Find users to email

        for
 user in
 User
.members_soon_to_expire


                puts "
Emailing 
#{
user.name}

"

                UserNotifier
.deliver_expire_soon_notification(user)


        end

  end

end
使用你的model只用一步，"=> :environment"

task(:send_expire_soon_emails => :environment) do

如果在我的开发环境上运行这个任务，我只需要 "rake utils:send_expire_soon_emails" ， 如果我想在产品环境下运行这个任务，我需要"rake RAILS_ENV=production utils:send_expire_soon_emails" 。

如果你想在每晚都运行这个任务，你需要写一个 cronjob ，像这样：

 0
 0
 * * * cd /
var
/

www/apps/rails_app/ && /
usr
/

local/bin/rake RAILS_ENV
=production utils:send_expire_soon_emails
相当的方便。

十、在哪找到一些例子

现在对一个有用的rake任务已经了解很多了，那么我将给你几个资源，我想最好的学习方法是看看别人的代码。

brand new rake tasks 在edge rails 中，这个可以创建和重置你的数据库。

Craig Ambrose写的数据库备份， database backups 。

Adam Greene写了一组任务 set of Rake tasks ，可以将所有的数据备份到amazon S3。他还给了我一个升级版本，你可以在这下载here 。

Jay Fields的任务测试，testing rake tasks 。

a new way of setting the RAILS_ENV and teaches how to use rake to boot you into a Mysql shell （看的时候留意一下他的注释）

Rake Bookshelf Books ， 和Martin Fowler的Using the Rake Build Language 教程，这两个都很有用，虽然有点过时。

如果你发现其他更好的文章，发贴子给我们。

译者：恩，这段不用翻译，懂的朋友自然会去看的了。

Still reading? If you are, I wanted to let you know that we're looking for more people to write for RailsEnvy. If you have an idea for a good rails tutorial we want to hear from you! Basically we would work with you to flesh out the tutorial and help polish (acting as an editor). It could definitely be a great way to get your name out there, and start getting some hits (for your blog or company). Email Gregg at RailsEnvy if you're interested.

另：我刚收到jim的邮件，如何更简单的创建我的目录。
 # This is needed because the existing version of directory in Rake is slightly broken, but Jim says it'll be fixed in the next version.



alias
 :original_directory
 :directory



def
 directory
(dir)


  original_directory dir


  Rake
::Task
[dir]


end

# Do the directory creation

namespace :utils
 do

  task :create_directories
 => [

    directory('
public/icons
'

),

    directory('
public/images
'

),


    directory('
public/groups
'
),

  ]

end

注：图片均来自英文原文(Pics come from the english page)

(译者：目前这个内容不是研究的重点，所以会不忙的时候翻译一点点)

```