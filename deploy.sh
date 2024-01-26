#!/usr/bin/env sh

echo '开始执行命令'
# 生成静态文件
echo ''
echo '执行命令：gitbook build .'
echo ''
gitbook build .

# 进入生成的文件夹
echo ''
echo "执行命令：cd ./_book"
echo ''
cd ./_book

# 发布到自定义域名
echo ''
echo "把域名放到CNAME文件中"
echo 'yu66.vip' > CNAME
echo ''

# 初始化一个仓库，仅仅是做了一个初始化的操作，项目里的文件还没有被跟踪
echo ''
echo "执行命令：git init"
echo ''
git init

# 保存所有的修改
echo ''
echo "执行命令：git add -A"
echo ''
git add -A

# 把修改的文件提交
echo ''
echo "执行命令：commit -m 'deploy'"
echo ''
git commit -m 'deploy'

## 新建一个分支，解决git init命令生成的默认分支名字不确定问题(旧版本是master，新版本(2.39.3)是main)
echo ''
echo "执行命令：git checkout -b front-end"
git checkout -b front-end

# 发布到码云网站
echo ''
echo "执行命令：git push -f https://gitee.com/dragon-li/my-wiki front-end:gh-pages"
echo ''
git push -f https://gitee.com/dragon-li/my-wiki front-end:gh-pages

echo ""
echo "打开码云 Gitee Pages 服务，手动更新服务"
open https://gitee.com/dragon-li/my-wiki/pages


# 发布到github网站: https://<USERNAME>.github.io/<REPO>
echo ''
echo "发布到github网站服务，执行命令：git push -f git@github.com:yulilong/my_blog.git front-end:gh-pages"
git push -f git@github.com:yulilong/my_blog.git front-end:gh-pages


# 返回到上一次的工作目录
echo ''
echo "回到刚才工作目录"
cd -
