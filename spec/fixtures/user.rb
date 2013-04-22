# User and UserDecorator is an example with ActiveModel and Draper

class User
  extend ActiveModel::Naming
  attr_accessor :status

  def self.status_options
    %w[ approved rejected ]
  end
end

class UserDecorator < Draper::Decorator
  decorates :user
  humanizes :status
end
