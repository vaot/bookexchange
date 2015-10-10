# This is a comment
FROM ruby:2.2
MAINTAINER Vaot "victorvaot@gmail.com"

# Base
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -qy nginx curl nodejs less vim


ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

ADD . $APP_HOME
