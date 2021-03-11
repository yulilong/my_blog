[TOC]



# linux下ssh配置

## 1. 在支持SSH命令的环境中使用密钥对（通过命令配置）

1、获取.pem私钥文件

比如从阿里云ECS 创建生成的秘钥文件：https://help.aliyun.com/document_detail/51793.html?spm=5176.10695662.1996646101.searchclickresult.1e0711bbFycE9l

2、获取到问秘钥文件放到本机存储：

如：`~/.ssh/ecs.pem`，此处路径和文件名称仅为示例，请根据实际情况修改。

3、运行以下命令修改私钥文件的属性

`chmod 400 [.pem私钥文件在本地机上的存储路径]`，例如：

```bash
chmod 400 ~/.ssh/ecs.pem
```

4、运行以下命令连接至实例

`ssh -i [.pem私钥文件在本地机上的存储路径] root@[公网IP地址]`，例如：

```bash
ssh -i ~/.ssh/ecs.pem root@10.10.xx.xxx
```

## 2. 在支持SSH命令的环境中使用密钥对（通过config文件配置）

在Linux和其他支持SSH命令的环境中通过config配置所需信息，并通过SSH命令连接Linux实例。

1.  进入用户主目录下的.ssh目录，按照如下方式修改config文件。

    ~/.ssh/ecs.pem为私钥文件在本地机上的存储路径。

    ```
    Host ecs    // 输入ECS实例的名称
    HostName 192.*.*.*   // 输入ECS实例的公网IP地址
    Port 22   // 输入端口号，默认为22
    User root   // 输入登录账号
    IdentityFile ~/.ssh/ecs.pem // 输入.pem私钥文件在本机的地址
    ```

2.  保存config文件。

3.  重启SSH。

4.  运行命令连接至实例。

    ```bash
    ssh [ECS实例的名称]
    ```

    示例如下：

    ```bash
    ssh ecs
    ```

