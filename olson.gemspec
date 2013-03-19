# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'olson/version'

Gem::Specification.new do |gem|
  gem.name          = "olson"
  gem.version       = Olson::VERSION
  gem.authors       = ["Kristian Freeman", "Amiel Martin"]
  gem.email         = ["kristian@kristianfreeman.com", "amiel@carnesmedia.com"]
  gem.description   = %q{Object-oriented humanize}
  gem.summary       = %q{
    Olson is a tool to help display identifiers to users. It’s basically a way to turn your decorator in to a wrapper for `.humanize` with automatic built-in support for I18n.

    See [Using I18n and Draper to Render Database Attributes](http://blog.amielmartin.com/post/12341219947/using-i18n-and-draper-to-render-database-attributes) to read more about this concept.
  }
  gem.homepage      = "http://github.com/carnesmedia/olson"

  gem.add_dependency 'active_support'
  gem.add_development_dependency "rspec"

  gem.test_files    = Dir['spec/**/*.rb']
  gem.files         = Dir['lib/**/*.rb'] + Dir['[A-Z]*'] + gem.test_files
  gem.require_paths = ["lib"]
end
