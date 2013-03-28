
require 'simplecov'
require 'coveralls'

Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter,
]

SimpleCov.start

require 'rubygems'
require 'bundler/setup'

require 'olson'
require 'ostruct'
require 'draper'
require 'draper_initializer'

RSpec.configure do |config|
  # some (optional) config here
end
