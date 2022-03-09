require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'capistrano/rails'
require "capistrano/rbenv"
require "capistrano/bundler"
require 'capistrano/passenger'
require 'capistrano-resque'

set :rbenv_type, :user
set :rbenv_ruby, '2.7.3'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
