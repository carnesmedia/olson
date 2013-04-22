module Olson
  extend ActiveSupport::Concern

  # See +ApplicationDecorator.humanize+
  def humanize(attribute, value = model.send(attribute), default = self.class.default_humanize(value))
    self.class.humanize attribute, value, default
  end
end
