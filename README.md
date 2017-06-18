Africdre Projects
=================

Tools
----
- vagrant + shell + virtualbox
- ubuntu 14.4
- php7.1
- nginx

How to install ?
--------------
In the host machine, ensure vagrant and virtualbox are installed

```shell
$ git clone git@github.com:abarry/africadre.git
$ cd africadre
$ vagrant up --provision
```

Edit your hosts and add the following line

```shell
$ sudo vim /etc/hosts
10.10.10.10     dev.africadre.com dev.jobs.africadre.com
```

That's it !


