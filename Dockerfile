# This is a comment
FROM ruby:2.2
MAINTAINER Vaot "victorvaot@gmail.com"

# Base
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -qy nginx curl nodejs less vim


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Rails
COPY . /usr/src/app

ADD deployment/nginx/nginx.conf /etc/nginx/sites-available/default
RUN mkdir -p tmp/pids tmp/sockets tmp/cache tmp/sessions

COPY deployment/docker/* /usr/bin/
RUN chmod +x /usr/bin/*

EXPOSE 80
