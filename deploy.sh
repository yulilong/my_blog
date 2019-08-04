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

# 如果发布到 https://<USERNAME>.github.io/<REPO>
echo ''
echo "执行命令：git push -f https://github.com/yulilong/my_blog.git master:gh-pages"
git push -f https://github.com/yulilong/my_blog.git master:gh-pages

echo ''
echo "执行命令：git push -f https://gitee.com/dragon-li/my-wiki master:gh-pages"
echo ''
git push -f https://gitee.com/dragon-li/my-wiki master:gh-pages

# 返回到上一次的工作目录
echo ''
echo "回到刚才工作目录"
cd -