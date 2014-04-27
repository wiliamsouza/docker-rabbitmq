# RabbitMQ server generic image source
#
# Version 0.1.0

FROM ubuntu:12.04

MAINTAINER Wiliam Souza <wiliamsouza83@gmail.com>

# Base
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main restricted universe multiverse" > /etc/apt/sources.list

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y python-software-properties

# supervisord
RUN apt-get install supervisor -y
RUN update-rc.d -f supervisor disable

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# start script
ADD startup /usr/local/bin/startup
RUN chmod +x /usr/local/bin/startup

CMD ["/usr/local/bin/startup"]

# Environment

# sources

# ppas

# update
RUN apt-get update

#rabbitmq-server 
RUN apt-get install rabbitmq-server -y
RUN update-rc.d -f rabbitmq-server disable

VOLUME ["/var/log/rabbitmq", "/var/lib/rabbitmq"]

EXPOSE 5672
