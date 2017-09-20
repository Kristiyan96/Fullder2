# frozen_string_literal: true
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.4.1'

gem 'rails', '>= 5.0.0.rc2', '< 5.1'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Using images
gem 'paperclip'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# Multiple select.
gem 'select2-rails'
# Use devise for user auth
gem 'devise'
# Authorization
gem 'cancancan'
# Heroku deploy
gem 'figaro'
# Use pg for database
gem 'pg'
# Use puma for server
gem 'puma'
# Simple forms
gem 'simple_form'
# Decorate models for views
gem 'draper', github: 'audionerd/draper', branch: 'rails5'
# Awesome fonts for webpage(adds cool icons and stuff)
gem 'font-awesome-rails'
# Slim template engine
gem 'slim-rails'
# Use google geokits api
gem 'geokit-rails'
# For geo location
gem 'geocoder'
# Displaying things on google maps
gem 'gmaps4rails'
# Use paging
gem 'kaminari'
gem 'bootstrap-kaminari-views'
# Easier nested forms.
gem 'cocoon'
# JavaScript embedded interpreter for ruby
gem 'therubyracer', platform: :ruby
# Localization
gem 'rails-i18n', '~> 5.0.0'
# Translating object fields
gem 'globalize', github: 'globalize/globalize'
# This is needed by globalize
gem 'activemodel-serializers-xml'
# Respond gem for different types of requests
gem 'responders'
# UI stuff
gem 'jquery-ui-rails'
gem 'jquery-timepicker-rails'
gem 'bootstrap-select-rails'
# Login with facebook, google and twitter
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-twitter'
# Use friendly urls
gem 'friendly_id'
gem 'momentjs-rails', '>= 2.9.0'
# Use jquery datetime picker
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.37'
gem 'bootstrap-datepicker-rails'
# Async jobs
gem 'sidekiq'
# Web interface for sidekiq
gem 'sinatra', github: 'sinatra', require: false
# Parse spreadsheets
gem 'roo'
# Click to copy
gem 'clipboard-rails'
# Uploading images with ajax
gem 'remotipart'
# Google places to find restaurants
gem 'google_places'
# Requiring captcha on forms, human verification
gem 'recaptcha', require: 'recaptcha/rails'

group :development do
  gem 'spring'
  gem 'web-console', '~> 2.0'
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_21]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'haml2slim'
  gem 'html2haml'
  gem 'rails_apps_pages'
  gem 'rails_apps_testing'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'spring-commands-rspec'
  gem 'capistrano3-nginx', '~> 2.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rbenv',   require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'byebug'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
