
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
require 'active_model'
require 'draper'
require 'draper_initializer'

spec_dir = Pathname.new(__FILE__).dirname

Dir[spec_dir.join("fixtures/**/*.rb")].each { |f| require f }
Dir[spec_dir.join("support/**/*.rb")].each { |f| require f }


RSpec.configure do |config|
  # some (optional) config here
end
