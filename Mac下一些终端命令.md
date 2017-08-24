[TOC]   

## 介绍   

macos的很多用户都是做it相关的人，类unix系统带来了很多方面，尤其是经常和Linux打交道的人。 但是作为经常使用linux 命令行的人发现macos中的命令行工具很多都是bsd工具，跟linux下得使用方式开始差距挺大的        

Max OS X使用的是 BSD版本的命令行工具，这些命令跟 Linux版本是有些不同的，然而它们都遵循 POSIX 标准。    

资料：  http://blog.csdn.net/orangleliu/article/details/47357339


## **查看进程**    

```
# 搜索特定进程，
~ ps aux|grep 进程名字
# 动态显示进程
~ top
```  

## **查看端口号**   

```
# 搜索端口号为8080, 可以看见进程名字与ID
lsof -i:8080   
# 查看IPv4端口：(最好加 sudo)
~ lsof -Pnl +M -i4   

# 查看IPv6协议下的端口
lsof -Pnl +M -i6

~ sudo netstat antup
```   

参考链接：     

http://blog.csdn.net/u011619283/article/details/53116291     
http://blog.csdn.net/winkenjiang/article/details/7588658