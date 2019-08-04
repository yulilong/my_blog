## rails fileutils.rb:250:in `mkdir': Permission denied @ dir_s_mkdir
http://stackoverflow.com/questions/33754137/rails-server-command-returns-error-mkdir-permission-denied-dir-s-mkdir
这个问题就是rails要创建的文件没有权限，如果你了解这个文件路径，那么可以手动修改这个路径的权限,则问题就解决了。
```
sudo mkdir tmp
sudo chmod 777 tmp
```

## 由于之前安装了miq-Citrix,导致manageiq登陆不上提示token无效

删除系统中/var 中的 www 文件夹就好了



## Mac下irb中文乱码

错误信息：
```
// 在终端使用irb， 然后使用中文字符串会出现下面问题
irb(main):002:0* str = '\U+FFE4\U+FFB8\U+FFAD\U+FFE5\U+FFBD'
```
解决办法：

经查找在Mac下需要`readline` 编译ruby版本才可以。   

```
// 先安装readline
brew install readline
Updating Homebrew...
Downloading https://homebrew.bintray.com/bottles/readline-7.0.3_1.high_sierr
######################################################################## 100.0%
==> Pouring readline-7.0.3_1.high_sierra.bottle.tar.gz
==> Caveats
This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS provides the BSD libedit library, which shadows libreadline.
In order to prevent conflicts when programs look for libreadline we are
defaulting this GNU Readline installation to keg-only..

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/readline/lib
    CPPFLAGS: -I/usr/local/opt/readline/include

==> Summary
🍺  /usr/local/Cellar/readline/7.0.3_1: 46 files, 1.5MB

// 卸载ruby版本
// 使用上面的路径来安装新的ruby版本
LDFLAGS:  -L/usr/local/opt/readline/lib CPPFLAGS: -I/usr/local/opt/readline/include rvm install ruby版本


// 安装好后重新reload一下环境
rvm reload
// 使用刚安装的ruby版本
rvm use ruby版本
```


参考链接： http://my.tv.sohu.com/us/63263814/28072115.shtml