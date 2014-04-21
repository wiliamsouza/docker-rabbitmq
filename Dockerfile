# RabbitMQ container used for local development environment
#
# Version 0.1.0

FROM ubuntu:12.04

MAINTAINER Wiliam Souza <wiliamsouza83@gmail.com>

# Set language
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://br.archive.ubuntu.com/ubuntu precise-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://br.archive.ubuntu.com/ubuntu/ precise-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu precise-security main restricted universe multiverse" >> /etc/apt/sources.list

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y python-software-properties

RUN dpkg-divert --local --rename --add /sbin/initctl

# update
RUN apt-get update

#rabbitmq 
RUN apt-get install rabbitmq-server -y

RUN update-rc.d -f rabbitmq-server disable

ADD pre_rabbitmq /usr/local/bin/pre_rabbitmq
RUN chmod +x /usr/local/bin/pre_rabbitmq

# supervisord
RUN apt-get install supervisor -y

RUN update-rc.d -f supervisor disable

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/var/log/rabbitmq", "/var/lib/rabbitmq"]

EXPOSE 5672

CMD ["/usr/local/bin/pre_rabbitmq"]
