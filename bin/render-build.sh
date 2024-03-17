#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
NODE_OPTIONS=--openssl-legacy-provider RAILS_ENV=production bundle exec rails assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
bundle exec rake db:seed
