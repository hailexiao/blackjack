class Hand
  attr_reader :hand
  def initialize(owner, card_1, card_2)
    @owner = owner
    @hand = []
    @hand << card_1 << card_2
    puts "#{@owner} was dealt #{card_1.identity}#{card_1.suit}"
    puts "#{@owner} was dealt #{card_2.identity}#{card_2.suit}"
  end

  def hit(card)
    @hand << card
    puts "#{@owner} was dealt #{card.identity}#{card.suit}"
  end

  def score
    @score = 0
    aces = 0
    @hand.each do |card|
      case card.value
      when 2..10
        @score += card.value
      when 11..13
        @score += 10
      when 1
        @score += 11
        aces += 1
      end
    end

    while (@score > 21) && (aces>0)
      @score -= 10
      aces -= 1
    end

    @score
  end

  def bust?
    @score > 21
  end
end
