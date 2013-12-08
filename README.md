gitkata2-gitolite
=================


Links
-----

http://gitolite.com/gitolite/master-toc.html


Vagrant
-------

```
$ vagrant box add precise32 http://files.vagrantup.com/precise32.box
$ vagrant init precise32
$ vagrant up
```

Setup
-----

```
$ git clone https://github.com/wybczu/gitkata2-gitolite.git
$ vagrant ssh
$ sudo apt-get update && sudo apt-get install -y vim git
$ /vagrant/gitkata2-gitolite/create-fake-users.sh
$ cp .ssh/admin.pub /tmp/
$ sudo adduser -q --gecos "Git user" --home /srv/git --disabled-password git
$ sudo su - git
$ git clone git://github.com/sitaramc/gitolite
$ mkdir bin && gitolite/install -ln
$ bin/gitolite setup -pk /tmp/admin.pub
$ logout
```

Config
------

```
$ git clone admin:gitolite-admin
```

Hooks
-----

```
# ~/.gitolite.rc
[...]
GIT_CONFIG_KEYS            =>  '.*',
LOCAL_CODE                 =>  "$rc{GL_ADMIN_BASE}/local",
'repo-specific-hooks',
[...]
```


Configuration snippets
----------------------


```
@all-devs  = admin u1 u2 u3 u4 u5 u6
@students  = u1
@admins    = admin

repo pub/CREATOR/..*
    C       =   @all
    RW+     =   CREATOR

repo r2
    RW+                     =   u1 u2 u3
    -   VREF/NAME/Makefile  =   u1
```

