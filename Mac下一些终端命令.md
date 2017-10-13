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

------------------

## 终端使用代理     

### 在终端中直接运行命令    

```
export http_proxy=http://proxyAddress:port
```  

这个办法的好处是简单直接，并且影响面很小（只对当前终端有效）。      

### 把代理服务器地址写入shell配置文件.bashrc或者.zshrc     

直接在.bashrc或者.zshrc添加下面内容:    

```
# vi ~/.ashrc    

export http_proxy="http://localhost:port"
export https_proxy="http://localhost:port"   

# 以使用shadowsocks代理为例，ss的代理端口为1080,那么应该设置为：   
export http_proxy="http://127.0.0.1:1080"
export https_proxy="http://127.0.0.1:1080"
```

localhost就是一个域名，域名默认指向 127.0.0.1，两者是一样的。     
然后ESC后:wq保存文件，接着在终端中执行source ~/.bashrc        
或者退出当前终端再起一个终端。 这个办法的好处是把代理服务器永久保存了，下次就可以直接用了。