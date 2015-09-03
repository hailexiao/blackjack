class Deck
  SUITS = ["♠", "♥", "♦", "♣"]
  VALUES = 1..13

  def initialize
    @deck = []
    @deck = SUITS.flat_map do |suit|
      VALUES.map do |value|
        Card.new(suit,value)
      end
    end

  end

  def size
    @deck.length
  end

  def deal
    @deck.shift
  end

  def shuffle
    @deck.shuffle!
  end

end
