module Storify::Randomizer
  def order_number
    SecureRandom.hex[0,6].upcase
  end

  module_function :order_number
end
