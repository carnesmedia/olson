# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', cli: '--format doc --color', keep_failed: false, all_after_pass: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/olson_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^spec/fixtures/.*\.rb$})  { "spec" }
end

