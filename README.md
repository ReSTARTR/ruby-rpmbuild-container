
Build ruby rpm on Docker container
----

1. Start the guest machine

```bash
$ vagrant up
$ vagrant ssh
```

2. Build docker container

```
$ cd /vagrant
$ sudo docker build -t <USERNAME>/rubybuild .
```

3. rpmbuild in the container

```bash
$ sudo docker run --rm -it <CONTAINER> /bin/sh ./rubybuild.sh
```

4. check the rpm file on virtual machine

```bash
$ ls *.rpm
ruby-2.0.0p481-2.el6.x86_64.rpm
```

Enjoy!
