source 'https://rubygems.org'

gem 'slim-rails'
gem 'dotenv-rails'

gem 'rails'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise'
gem 'devise-i18n'

gem 'unicorn'
# TODO
# gem 'unicorn-worker-killer'

gem 'grape', git: 'git@github.com:intridea/grape.git'
gem 'grape_logging'

group :development do
  gem 'capistrano-rails'
  gem 'annotate'
end

group :test do
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'spring-commands-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'json_expressions'
  gem 'rubocop'
  gem 'codeclimate-test-reporter', require: nil
end

group :development, :test do
  gem 'spring'
end
