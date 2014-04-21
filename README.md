docker-rabbitmq
------------

Docker rabbitmq container template used to create development environment.

It enforces the ``uid`` and ``gid`` from user rabbitmq and it defaults
to 1000 to avoid problems with docker volume permissions.

To build run:

```
$ docker.io build -t wiliamsouza/rabbitmq .
```

Change `wiliamsouza` to your Docker
[index](https://index.docker.io/u/wiliamsouza/) username.

Shell access:

```
$ docker.io run -h rabbitmq -i -t wiliamsouza/rabbitmq /bin/bash
```

Usage:

```
$ docker.io run -h rabbitmq -p 5672:5672 -d -v /home/wiliam/devel/docker-rabbitmq/data/log:/var/log/rabbitmq -t wiliamsouza/rabbitmq
```
