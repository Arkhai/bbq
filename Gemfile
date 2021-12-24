source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'carrierwave'
gem 'devise'
gem 'dotenv-rails'
gem 'fog-aws'
gem 'jquery-rails'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'rails_12factor'
gem 'rails-i18n', '~> 6.0.0'
gem 'rmagick'
gem 'sass-rails', '>= 6'
gem 'twitter-bootstrap-rails'
gem 'uglifier'
gem 'webpacker', '~> 5'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
