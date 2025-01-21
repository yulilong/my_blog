#!/usr/bin/env sh

echo '开始执行命令：'

echo '1、生成静态文件'
echo '执行命令：gitbook build .'
echo ''
gitbook build .

echo '2、进入生成的文件夹'
echo "执行命令：cd ./_book"
cd ./_book

# 发布到自定义域名
echo '3、发布到自定义域名'
echo '创建 CNAME 文件，并写入 yu66.vip值'
echo 'yu66.vip' > CNAME
echo ''

echo '4、初始化一个仓库'
echo "执行命令：git init"
git init

echo '5、添加所有文件到git'
echo "执行命令：git add -A"
echo ''
git add -A

echo '6、提交文件'
echo "执行命令：commit -m 'deploy'"
echo ''
git commit -m 'deploy'

# git init命令生成的默认分支名字：旧版本是master，新版本(2.39.3)是main
echo '7、新建一个 front-end 分支，解决git init命令生成的默认分支名字不确定问题'
echo "执行命令：git checkout -b front-end"
git checkout -b front-end

# 发布到码云网站
# echo '资源文件提交到 码云，用于 Gitee Pages 服务'
# echo "执行命令：git push -f https://gitee.com/dragon-li/my-wiki front-end:gh-pages"
# echo ''
# git push -f https://gitee.com/dragon-li/my-wiki front-end:gh-pages

# echo ""
# echo "打开码云 Gitee Pages 服务，手动更新服务"
# open https://gitee.com/dragon-li/my-wiki/pages


# 发布到github网站: https://<USERNAME>.github.io/<REPO>
echo '资源文件提交到github上，用于GitHub Pages 服务'
echo "执行命令：git push -f git@github.com:yulilong/my_blog.git front-end:gh-pages"
git push -f git@github.com:yulilong/my_blog.git front-end:gh-pages


echo '回到文档工作目录'
cd -
echo '前端代码打包发布结束'
