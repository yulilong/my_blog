从文件内容查找匹配指定字符串的行：
```bash
$ grep "被查找的字符串" 文件名
```
例子：在当前目录里第一级文件夹中寻找包含指定字符串的.in文件
```bash
$ grep "thermcontact" */*.in
```
从文件内容查找与正则表达式匹配的行：
```bash
$ grep –e “正则表达式” 文件名
```
查找时不区分大小写：
```bash
$ grep –i "被查找的字符串" 文件名
```
查找匹配的行数：
```bash
$ grep -c "被查找的字符串" 文件名
```

从文件内容查找不匹配指定字符串的行：
```bash
$ grep –v "被查找的字符串" 文件名
```

从根目录开始查找所有扩展名为.log的文本文件，并找出包含”ERROR”的行
```bash
find / -type f -name "*.log" | xargs grep "ERROR"
```
例子：从当前目录开始查找所有扩展名为.in的文本文件，并找出包含”thermcontact”的行
```bash
find . -name "*.in" | xargs grep "thermcontact"
```

http://blog.chinaunix.net/uid-25266990-id-199887.html



### shell命令搞定某个文件夹下java代码行数的统计

```bash
find . -name "*.java"|xargs wc -l|grep "total"|awk '{print $1}'  
find . -name "*.java"|xargs cat|wc -l    #Output:37634  
```

上面的两句效果一样，只不过第二种是先利用cat将多个java文件的内容合并输出了。然后再统计。

不过两个都有共同的毛病——连文件里面的空行都给统计进去算作一行了。

去除空行版:

```bash
find . -name "*.java"|xargs cat|grep -v ^$|wc -l
```

去除注释版:

```bash
# exclude the lines begin with //  
find . -name "*.java"|xargs cat|grep -v -e ^$ -e ^\s*\/\/.*$|wc -l
```

参考链接：https://blog.csdn.net/yhhwatl/article/details/52623879