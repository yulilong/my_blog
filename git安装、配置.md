#git install
```
sudo yum update
sudo yum install -y git
git config --global user.name "Michael Fan"
git config --global user.email fanlinsheng@gmail.com
git config --global core.editor vim
git config --global credential.helper store
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short'
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --list
```

#github Personal access tokens
385f054bdcf8d95b4372c6e5199818388420c0fd

#git-credentials
```
$ vim ~/.git-credentials
```
```
https://yulilong:password@bitbucket.org
http://yulilong:password@bitbucket.org
https://yulilong:385f054bdcf8d95b4372c6e5199818388420c0fd@github.com
http://yulilong:385f054bdcf8d95b4372c6e5199818388420c0fd@github.com
```
```
$ git config --global credential.helper store
```