#!/usr/bin/env bash
# exit on error
set -o errexit

# Change to your Rails app directory
cd /code/rails/scoreapp

# Run the necessary commands for building your Rails app
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
