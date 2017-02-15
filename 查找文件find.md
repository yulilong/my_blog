* **1. 基本用法：**    

```
$ find / -name 文件名      
# find ver1.d ver2.d -name '*.c' -print    查找ver1.d,ver2.d *.c文件并打印      
# find . -type d -print 从当前目录查找，仅查找目录，找到后，打印路径名。可用于打印目录结构。
```    

* **2. 无错误查找：**    

```
find / -name access_log 2 >/dev/null
```    

* **3. 按尺寸查找：**    

```
$ find / -size 1500c  #（查找1,500字节大小的文件，c表示字节）
$ find / -size +1500c #（查找大于1,500字节大小的文件，+表示大于）    
$ find / -size +1500c #（查找小于1,500字节大小的文件，-表示小于）  
```    

* **4. 按时间：**    

```
$ find / -amin n   # 最后n分钟
$ find / -atime n  # 最后n天
$ find / -cmin n   # 最后n分钟改变状态
$ find / -ctime n  # 最后n天改变状态
```   

* **5. 其它：**    

```
$ find / -empty           # 空白文件、空白文件夹、没有子目录的文件夹
$ find / -false           # 查找系统中总是错误的文件
$ find / -fstype type     # 找存在于指定文件系统的文件，如type为ext2
$ find / -gid n           # 组id为n的文件
$ find / -group gname     # 组名为gname的文件
$ find / -depth n         # 在某层指定目录中优先查找文件内容
$ find / -maxdepth levels # 在某个层次目录中按递减方式查找
```