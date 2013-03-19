# Olson

*Apparently it's a reference to Mad Men and Draper...*

[![Code Climate](https://codeclimate.com/github/carnesmedia/olson.png)](https://codeclimate.com/github/carnesmedia/olson)

Olson is a tool to help display identifiers to users. It’s basically a way to turn your decorator in to a wrapper for `.humanize` with automatic built-in support for I18n.

See [Using I18n and Draper to Render Database Attributes](http://blog.amielmartin.com/post/12341219947/using-i18n-and-draper-to-render-database-attributes) to read more about this concept.

## Installation

Add this line to your application's Gemfile:

    gem 'olson'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install olson

## Usage

Olson was designed to be used with [Draper](https://github.com/drapergem/draper). With some extra configuration, it can be used without Draper: see the **Usage without Draper** section below.

### Basic usage

```ruby
class UserDecorator < Draper::Decorator
 include Olson
 humanizes :status
end

user = User.first
user.status # => "submitted"
UserDecorator.decorate(user).status # => "Submitted"
```

### I18n

Olson will automatically utilize any i18n set in `config/locales` as well:

```ruby
status:
 accepted: "Accepted and awesome"
 submitted: "Still out in space"
 not_available: "N/A"
```

```ruby
class UserDecorator < Draper::Decorator
 include Olson
 humanizes :status
end

user = User.first
user.status # => "submitted"
UserDecorator.decorate(user).status # => "Still out in space"
```

Olson will search the following I18n keys:


* `user.status.submitted`
* `status.submitted`
* `submitted`

### Options for select

If you define a specific class-level method with the options for an attribute, Olson will prepare options for select attributes in rails.

```ruby

# app/models/user.rb

class User < ActiveRecord::Base
 def self.status_options
   %w(submitted approved not_available)
 end
end

# config/locales/en.yml

en:
 user:
   status:
     not_available: "N/A"

# app/decorators/user_decorator.rb

class UserDecorator < Draper::Decorator
 humanizes :status
end

# Example

UserDecorator.status_options # => [["Submitted", "submitted"], ["Approved", "approved"], ["N/A", "not_available"]]

# app/views/users/_form.html.erb

<%# using formtastic or simple_form %>
<%= f.input :status, collection: UserDecorator.status_options %>
```

For usage in Rails with Draper, drop this into an initializer:

```ruby
class Draper::Decorator
 include Olson
end
```


## Usage without Draper

Olson can be used without Draper by defining `model`, `model_class`, and `model_name`.

## Contributing

1. Fork it

2. Create your feature branch (`git checkout -b my-new-feature`)

3. Commit your changes (`git commit -am 'Add some feature'`)

4. Push to the branch (`git push origin my-new-feature`)

5. Create new Pull Request
