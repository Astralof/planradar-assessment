require 'clockwork'

require File.expand_path('../config/boot', __dir__)
require File.expand_path('../config/environment', __dir__)

module Clockwork

  every(1.minute, '1 Minute jobs...') do
  end
end