# This is a comment
FROM ruby:2.2
MAINTAINER Vaot "victorvaot@gmail.com"

# Base
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -qy nginx curl nodejs less vim


ENV APP_HOME /bookexchange
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD deployment/nginx/nginx.conf /etc/nginx/sites-available/default

COPY deployment/docker/* /usr/bin/

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

EXPOSE 80
ADD . $APP_HOME
