#!/bin/bash

: ${RAILS_ENV?"Need to set RAILS_ENV"}
cd /usr/src/app
bundle exec sidekiq -C config/sidekiq.yml
