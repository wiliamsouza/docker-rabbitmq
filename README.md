docker-rabbitmq
---------------

Docker rabbitmq container template used to create development environment.

It enforces the ``uid`` and ``gid`` from user rabbitmq and it defaults
to 1000 to avoid problems with docker volume permissions.

To build run:

```
$ docker.io build -t wiliamsouza/rabbitmq .
```

Change `wiliamsouza` to your Docker
[index](https://index.docker.io/u/wiliamsouza/) username.

Environment variable:

You pass with ``-e`` docker option.

* ``RABBITMQ_NODENAME``: Node name defaults to ``bunny``.
* ``RABBITMQ_HOSTNAME``: Hostname defaults to ``$HOSTNAME`` if you not set it
                         you should pass ``-h`` to docker command line.

Shell access:

```
$ docker.io run -h rabbitmq -p 5672:5672 -i \
-v /home/wiliam/devel/docker-rabbitmq/data/log:/var/log/rabbitmq \
-v /home/wiliam/devel/docker-rabbitmq/data/rabbitmq:/var/lib/rabbitmq
-t wiliamsouza/rabbitmq /bin/bash
```

Usage:

```
$ docker.io run -h rabbitmq -p 5672:5672 -d \
-v /home/wiliam/devel/docker-rabbitmq/data/log:/var/log/rabbitmq \
-v /home/wiliam/devel/docker-rabbitmq/data/rabbitmq:/var/lib/rabbitmq \
-t wiliamsouza/rabbitmq
```
