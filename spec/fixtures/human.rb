# Human and HumanDecorator is an example without ActiveModel or Draper


class Human
  attr_accessor :status
  def self.model_name
    OpenStruct.new(i18n_key: "human")
  end
end

class HumanDecorator < SimpleDelegator
  include Olson
  humanizes :status

  alias_method :model, :__getobj__
  def self.model_name
    Human.model_name
  end
end
