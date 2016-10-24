## dnf -y install memcached Failed to open:
```
http://stackoverflow.com/questions/32541196/i-attempted-to-enable-the-epel-repo-on-my-fedora-22-machine-and-i-broke-it-now

This is what appears to have worked for me.

Remove the epel repo

rm -rf /etc/yum.repos.d/epel*

then try install epel via dnf

dnf clean all dnf install epel-release
```
#tar uncompress xxx.tar.xz
```
tar xf archive.tar.xz
tar xf archive.tar.gz
tar xf archive.tar
```