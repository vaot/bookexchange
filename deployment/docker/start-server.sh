#!/bin/bash

: ${RAILS_ENV?"Need to set RAILS_ENV"}
cd /usr/src/app
bundle exec puma -C config/puma/${RAILS_ENV}.rb
