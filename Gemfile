source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'carrierwave'
gem 'devise'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'mailjet'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-vkontakte'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'rails-i18n', '~> 6.0.0'
gem 'resque'
gem 'rmagick'
gem 'webpacker', '~> 5'

group :development, :test do
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-resque', require: false
  gem 'letter_opener'
  gem 'listen'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

group :production do
  gem 'pg'
end
