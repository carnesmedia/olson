# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'olson/version'

Gem::Specification.new do |gem|
  gem.name          = "olson"
  gem.version       = Olson::VERSION
  gem.authors       = ["Kristian Freeman, Amiel Martin"]
  gem.email         = ["kristian@kristianfreeman.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = "http://github.com/carnesmedia/olson"

  gem.add_development_dependency "rspec"

  gem.test_files    = Dir['spec/**/*.rb']
  gem.files         = Dir['lib/**/*.rb'] + Dir['[A-Z]*'] + gem.test_files
  gem.require_paths = ["lib"]
end
