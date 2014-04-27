docker-rabbitmq
---------------

Docker rabbitmq server generic image source. This is based on `ubuntu:12.04` image.

Image
-----

You can `pull` a ready to use image from Docker
[index](https://index.docker.io/u/wiliamsouza/) running:

```
$ docker.io pull wiliamsouza/rabbitmq
```

Or build this repository:

```
$ git clone https://github.com/wiliamsouza/docker-rabbitmq.git
$ cd docker-rabbitmq/
$ docker.io build -t wiliamsouza/rabbitmq .
```

Change `wiliamsouza/rabbitmq` to your Docker index username.

Container
---------

This image uses volumes and environment variables to control the rabbitmq server
configuration.

Volumes:

* `/var/lib/rabbitmq`: Data goes here.
* `/var/log/rabbitmq`: Access log from the container using it.

You pass with `-v` docker option. Don't forget to use absolute path here.

Environment variable:

* ``RABBITMQ_NODENAME``: Node name defaults to ``bunny``.
* ``RABBITMQ_HOSTNAME``: Hostname defaults to ``$HOSTNAME`` if you not set it
                         you should pass ``-h`` to docker command line.

You pass with `-e` docker option.

Shell access:

```
$ docker.io run -p 5672:5672 -i \
-v `pwd`/volumes/log:/var/log/rabbitmq \
-v `pwd`/volumes/lib:/var/lib/rabbitmq
-t wiliamsouza/rabbitmq /bin/bash
```

The command above will start a container give you a shell. Don't
forget to start the service running the `startup &` script.

Usage:

```
$ docker.io run --name rabbitmq -h rabbitmq -p 5672:5672 -d \
-v `pwd`/volumes/log:/var/log/rabbitmq \
-v `pwd`/volumes/lib:/var/lib/rabbitmq \
-t wiliamsouza/rabbitmq
```

The command above will start a container and return its ID.
