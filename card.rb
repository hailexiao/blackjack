class Card
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def identity
    case @value
    when (2..10)
      return @value
    when 11
      return "J"
    when 12
      return "Q"
    when 13
      return "K"
    when 1
      return "A"
    end
  end
end
