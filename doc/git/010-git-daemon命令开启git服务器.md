[TOC]



# git daemon命令开启git服务器，供局域网其他电脑拉取、上传代码

## 1. 创建文件夹，用于存放repository

首先在自己电脑一个地方创建文件夹，这个文件夹里面用来存放repository仓库。

比如创建的文件夹名字：`gitRepository`

## 2. 把git代码文件夹放到创建的文件夹中

复制git代码仓库到gitRepository文件夹后，终端打开这个代码仓库，执行如下命令：

```bash
git config receive.denyCurrentBranch ignore
```

此命令解决如下报错的：

```bash
remote: error: refusing to update checked out branch: refs/heads/master
remote: error: By default, updating the current branch in a non-bare repository
remote: is denied, because it will make the index and work tree inconsistent
remote: with what you pushed, and will require 'git reset --hard' to match
remote: the work tree to HEAD.
remote:
remote: You can set the 'receive.denyCurrentBranch' configuration variable
remote: to 'ignore' or 'warn' in the remote repository to allow pushing into
remote: its current branch; however, this is not recommended unless you
remote: arranged to update its work tree to match what you pushed in some
remote: other way.
remote:
remote: To squelch this message and still keep the default behaviour, set
remote: 'receive.denyCurrentBranch' configuration variable to 'refuse'.
To git://192.168.1.116/ttt
 ! [remote rejected] master -> master (branch is currently checked out)
error: failed to push some refs to 'git://192.168.1.116/ttt'
```

## 3. 启动git带的服务，开启仓库

终端打开`gitRepository`文件夹后，运行如下命令：

```bash
git daemon --reuseaddr --base-path=. --export-all --verbose --enable=receive-pack
```

上面的命令可以克隆仓库、推送代码。

如果希望只克隆仓库，可使用如下命令：

```bash
git daemon --verbose --export-all --base-path=.
```

## 4. 局域网中其他电脑设置仓库地址

如果是下载仓库，则：

```bash
git clone git://192.168.1.116/ttt
```

```
git remote add origin git://192.168.1.116/ttt
```











