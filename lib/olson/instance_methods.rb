module Olson
  extend ActiveSupport::Concern

  # See +ApplicationDecorator.humanize+
  def humanize(attribute, key = model.send(attribute), default = key.to_s.humanize)
    self.class.humanize attribute, key, default
  end
end
