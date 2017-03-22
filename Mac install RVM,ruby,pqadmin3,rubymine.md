## **install RVM**   
 
1.未装homebrew先装homebrew，否则报错：     
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```      
如果有安装homebrew，但是在后面的ruby安装过程中出现如下错误,        
有可能是你更新mac系统造成的，我是通过卸载重装homebrew来解决这个问题的.       
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```     
2.安装rvm    
```
$ curl -L https://get.rvm.io | bash -s stable
# 启用RVM
$ source ~/.rvm/scripts/rvm   
# 检查一下是否安装正确命令
$ rvm -v
# 如果出现邦本则说明安装成功
```    

## 2. 安装 rubymine ruby编辑器      

1 下载 download      
链接: https://pan.baidu.com/s/1hr8NpZY    
密码: ey5a