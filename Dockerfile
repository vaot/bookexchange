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
RUN ["/bin/sh", "-c", "bundle install"]

ADD deployment/docker/nginx-sites.conf /etc/nginx/sites-enabled/default
ADD deployment/docker/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p tmp/pids tmp/sockets tmp/cache tmp/sessions log

COPY deployment/docker/* /usr/bin/
RUN chmod +x /usr/bin/*

RUN RAILS_ENV=production bundle exec rake assets:precompile --trace

EXPOSE 80
