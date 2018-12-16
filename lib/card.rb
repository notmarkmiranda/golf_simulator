class Card
  attr_reader :number, :suit

  VALUES = {
    'JO' => -3,
    'A' => 1,
    'K' => 0,
    'Q' => 10,
    'J' => 10
  }

  def initialize(number:, suit: nil)
    @number = number
    @suit = suit
  end

  def value
    VALUES[number] || number.to_i
  end
end