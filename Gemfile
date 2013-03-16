source 'https://rubygems.org'

RONIN_URI = 'http://github.com/ronin-ruby'

gemspec

gem 'cinch-commands', '~> 0.1', :git => 'http://github.com/postmodern/cinch-commands.git'


# gem 'ronin-support',  '~> 0.4.0', :git => "#{RONIN_URI}/ronin-support.git"
# gem 'ronin',          '~> 1.4.0', :git => "#{RONIN_URI}/ronin.git"

group :development do
  gem 'rake',         '~> 0.8'
  gem 'kramdown',     '~> 0.12'

  gem 'rubygems-tasks', '~> 0.2'
  gem 'rspec',          '~> 2.4'
end

#
# To enable additional DataMapper adapters for development work or for
# testing purposes, simple set the ADAPTER or ADAPTERS environment
# variable:
#
#     export ADAPTER="postgres"
#     bundle install
#
#     ./bin/ronin --database postgres://ronin@localhost/ronin
#
require 'set'

DM_ADAPTERS = Set['postgres', 'mysql', 'oracle', 'sqlserver']

adapters = (ENV['ADAPTER'] || ENV['ADAPTERS']).to_s
adapters = Set.new(adapters.to_s.tr(',',' ').split)

(DM_ADAPTERS & adapters).each do |adapter|
  gem "dm-#{adapter}-adapter", DM_VERSION #, :git => "#{DM_URI}/dm-#{adapter}-adapter.git"
end
