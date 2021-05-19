find命令查找文件路径。      
http://www.server110.com/linux/201309/1457.html       
http://www.cnblogs.com/bigbean/p/3669739.html

* **1. 基本用法：**    

```bash
$ find / -name 文件名   
$ find / -name 'azure-armrest*' # 部分名字匹配 例如azure-armrest-0.3.9   
# find ver1.d ver2.d -name '*.c' -print    查找ver1.d,ver2.d *.c文件并打印      
# find . -type d -print 从当前目录查找，仅查找目录，找到后，打印路径名。可用于打印目录结构。
```

* **2. 无错误查找：**    

```bash
find / -name access_log 2 >/dev/null
```

* **3. 按尺寸查找：**    

```bash
$ find / -size 1500c  #（查找1,500字节大小的文件，c表示字节）
$ find / -size +1500c #（查找大于1,500字节大小的文件，+表示大于）    
$ find / -size +1500c #（查找小于1,500字节大小的文件，-表示小于）  
```

* **4. 按时间：**    

```bash
$ find / -amin n   # 最后n分钟
$ find / -atime n  # 最后n天
$ find / -cmin n   # 最后n分钟改变状态
$ find / -ctime n  # 最后n天改变状态
```

* **5. 其它：**    

```bash
$ find / -empty           # 空白文件、空白文件夹、没有子目录的文件夹
$ find / -false           # 查找系统中总是错误的文件
$ find / -fstype type     # 找存在于指定文件系统的文件，如type为ext2
$ find / -gid n           # 组id为n的文件
$ find / -group gname     # 组名为gname的文件
$ find / -depth n         # 在某层指定目录中优先查找文件内容
$ find / -maxdepth levels # 在某个层次目录中按递减方式查找
```

------------------------------------------------------------------------------------------------------

```
一、Linux中find常见用法示例 
find    path    -option    [    -print ]    [ -exec    -ok    command ]    {} ;
#-print 将查找到的文件输出到标准输出
#-exec    command    {} ;       -----将查到的文件执行command操作,{} 和 ;之间有空格
#-ok 和-exec相同，只不过在操作前要询用户 
==================================================== 
-name    filename               #查找名为filename的文件
-perm                         #按执行权限来查找
-user     username              #按文件属主来查找
-group groupname              #按组来查找
-mtime    -n +n                 #按文件更改时间来查找文件，-n指n天以内，+n指n天以前
-atime     -n +n                #按文件访问时间来查GIN: 0px">
-perm                          #按执行权限来查找
-user     username              #按文件属主来查找
-group groupname              #按组来查找
-mtime    -n +n                 #按文件更改时间来查找文件，-n指n天以内，+n指n天以前
-atime     -n +n                #按文件访问时间来查找文件，-n指n天以内，+n指n天以前
-ctime     -n +n                #按文件创建时间来查找文件，-n指n天以内，+n指n天以前
-nogroup                      #查无有效属组的文件，即文件的属组在/etc/groups中不存在
-nouser                       #查无有效属主的文件，即文件的属主在/etc/passwd中不存
-newer    f1 !f2                找文件，-n指n天以内，+n指n天以前
-ctime     -n +n                #按文件创建时间来查找文件，-n指n天以内，+n指n天以前
-nogroup                      #查无有效属组的文件，即文件的属组在/etc/groups中不存在
-nouser                       #查无有效属主的文件，即文件的属主在/etc/passwd中不存
-newer    f1 !f2                #查更改时间比f1新但比f2旧的文件
-type      b/d/c/p/l/f          #查是块设备、目录、字符设备、管道、符号链接、普通文件
-size       n[c]                #查长度为n块[或n字节]的文件
-depth                        #使查找在进入子目录前先行查找完本目录
-fstype                       #查更改时间比f1新但比f2旧的文件
-mount                        #查文件时不跨越文件系统mount点
-follow                       #如果遇到符号链接文件，就跟踪链接所指的文件
-cpio                         #对匹配的文件使用cpio命令，将他们备份到磁带设备中
-prune                        #忽略某个目录 ====================================================
$find    ~    -name    "*.txt"    -print      #在$HOME中查.txt文件并显示
$find    .     -name    "*.txt"    -print
$find    .     -name    "[A-Z]*"    -pri26nbsp;     #对匹配的文件使用cpio命令，将他们备份到磁带设备中
-prune                                #忽略某个目录 $find    .     -name    "[A-Z]*"    -print    #查以大写字母开头的文件
$find    /etc    -name    "host*"    -print #查以host开头的文件
$find    .    -name    "[a-z][a-z][0--9][0--9].txt"     -print    #查以两个小写字母和两个数字开头的txt文件
$find .    -perm    755    -print
$find    .    -perm -007    -exec ls -l {} ;    #查所有用户都可读写执行的文件同-perm 777
$find    . -type d    -print   打印目录结构
$find    .   !    -type    d    -print  打印非目录文件 
find /usr/include -name '*.h' -exec grep AF_INEF6 {} ; 因grep无法递归搜索子目录，故可以和find相结合使用。 在/usr/include 所有子目录中的.h文件中找字串AF_INEF6
$find    .    -type l    -print $find    .    -size    +1000000c    -print         #查长度大于1Mb的文件
$find    .    -size    100c          -print        # 查长度为100c的文件
$find    .    -size    +10    -print               #查长度超过期作废10块的文件（1块=512字节） $cd /
$find    etc    home    apps     -depth    -print    | cpio    -ivcdC65536    -o    /dev/rmt0
$find    /etc -name "passwd*"    -exec grep    "cnscn"    {}    ;    #看是否存在cnscn用户
$find . -name "yao*"    | xargs file
$find    . -name "yao*"    |    xargs    echo     "" > /tmp/core.log
$find    . -name "yao*"    | xargs    chmod    o-w
======================================================
find    -name april*                        在当前目录下查找以april开始的文件
find    -name    april*    fprint file          在当前目录下查找以april开始的文件，并把结果输出到file中
find    -name ap* -o -name may*    查找以ap或may开头的文件
find    /mnt    -name tom.txt    -ftype vfat    在/mnt下查找名称为tom.txt且文件系统类型为vfat的文件
find    /mnt    -name t.txt ! -ftype vfat     在/mnt下查找名称为tom.txt且文件系统类型不为vfat的文件
find    /tmp    -name wa* -type l             在/tmp下查找名为wa开头且类型为符号链接的文件
find    /home    -mtime    -2                   在/home下查最近两天内改动过的文件
find /home     -atime -1                    查1天之内被存取过的文件 
find /home -mmin     +60                    在/home下查60分钟前改动过的文件
find /home    -amin    +30                    查最近30分钟前被存取过的文件
find /home    -newer    tmp.txt               在/home下查更新时间比tmp.txt近的文件或目录
find /home    -anewer    tmp.txt              在/home下查存取时间比tmp.txt近的文件或目录
find    /home    -used    -2                    列出文件或目录被改动过之后，在2日内被存取过的文件或目录
find    /home    -user cnscn                  列出/home目录内属于用户cnscn的文件或目录
find    /home    -uid    +501                   列出/home目录内用户的识别码大于501的文件或目录
find    /home    -group    cnscn                列出/home内组为cnscn的文件或目录
find    /home    -gid 501                     列出/home内组id为501的文件或目录
find    /home    -nouser                      列出/home内不属于本地用户的文件或目录
find    /home    -nogroup                     列出/home内不属于本地组的文件或目录
find    /home     -name tmp.txt     -maxdepth    4    列出/home内的tmp.txt 查时深度最多为3层
find    /home    -name tmp.txt    -mindepth    3    从第2层开始查
find    /home    -empty                       查找大小为0的文件或空目录
find    /home    -size    +512k                 查大于512k的文件
find    /home    -size    -512k                 查小于512k的文件
find    /home    -links    +2                   查硬连接数大于2的文件或目录
find    /home    -perm    0700                  查权限为700的文件或目录
find    /tmp    -name tmp.txt    -exec cat {} ;
find    /tmp    -name    tmp.txt    -ok    rm {} ; 
find     /    -amin     -10         # 查找在系统中最后10分钟访问的文件
find     /    -atime    -2           # 查找在系统中最后48小时访问的文件
find     /    -empty                # 查找在系统中为空的文件或者文件夹
find     /    -group    cat          # 查找在系统中属于 groupcat的文件
find     /    -mmin    -5           # 查找在系统中最后5分钟里修改过的文件
find     /    -mtime    -1          #查找在系统中最后24小时里修改过的文件
find     /    -nouser               #查找在系统中属于作废用户的文件
find     /    -user     fred         #查找在系统中属于FRED这个用户的文件 查当前目录下的所有普通文件
-------------------------------------------------------------------------------- 
# find . -type f -exec ls -l {} ;
-rw-r--r--      1 root       root          34928 2003-02-25    ./conf/httpd.conf
-rw-r--r--      1 root       root          12959 2003-02-25    ./conf/magic
-rw-r--r--      1 root       root            180 2003-02-25    ./conf.d/README
查当前目录下的所有普通文件，并在- e x e c选项中使用ls -l命令将它们列出
=================================================
在/ l o g s目录中查找更改时间在5日以前的文件并删除它们：
$ find logs -type f -mtime +5 -exec    -ok    rm {} ;
=================================================
查询当天修改过的文件
[root@book class]# find    ./    -mtime    -1    -type f    -exec    ls -l    {} ;
=================================================
查询文件并询问是否要显示
[root@book class]# find    ./    -mtime    -1    -type f    -ok    ls -l    {} ;  
< ls ... ./classDB.inc.php > ? y
-rw-r--r--      1 cnscn      cnscn         13709    1月 12 12:22 ./classDB.inc.php
[root@book class]# find    ./    -mtime    -1    -type f    -ok    ls -l    {} ;  
< ls ... ./classDB.inc.php > ? n
[root@book class]# 
=================================================
查询并交给awk去处理
[root@book class]# who    |    awk    '{print $1"t"$2}'
cnscn     pts/0 
=================================================
awk---grep---sed [root@book class]# df    -k |    awk '{print $1}' |    grep    -v    'none' |    sed    s"//dev///g"
文件系统
sda2
sda1
[root@book class]# df    -k |    awk '{print $1}' |    grep    -v    'none'
文件系统
/dev/sda2
/dev/sda1

1)在/tmp中查找所有的*.h，并在这些文件中查找“SYSCALL_VECTOR"，最后打印出所有包含"SYSCALL_VECTOR"的文件名 
A) find    /tmp    -name    "*.h"    | xargs    -n50    grep SYSCALL_VECTOR

B) grep    SYSCALL_VECTOR    /tmp/*.h | cut     -d':'    -f1| uniq > filename

C) find    /tmp    -name "*.h"    -exec grep "SYSCALL_VECTOR"    {}    ; -print

2)find / -name filename -exec rm -rf {} ;
     find / -name filename -ok rm -rf {} ;

3)比如要查找磁盘中大于3M的文件：
find . -size +3000k -exec ls -ld {} ;

4)将find出来的东西拷到另一个地方
find *.c -exec cp '{}' /tmp ';' 如果有特殊文件，可以用cpio，也可以用这样的语法：
find dir -name filename -print | cpio -pdv newdir

6)查找2004-11-30 16:36:37时更改过的文件
# A=`find ./ -name "*php"` |    ls -l --full-time $A 2>/dev/null | grep "2004-11-30 16:36:37
```