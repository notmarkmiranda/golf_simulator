require './lib/card'

class Deck
  attr_reader :cards

  SUITS = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
  NUMBERS = [*2..10]
    .map(&:to_s)
    .push(["J", "Q", "K"])
    .flatten
    .unshift("A")

  def initialize
    @cards ||= initialize_deck
  end

  def card_count
    cards.count
  end

  def complete?
    card_count == 108
  end

  def shuffle!
    return true if self.complete? && cards.shuffle!
  end

  private

  def create_cards(cards)
    SUITS.each  do |suit|
      NUMBERS.each do |number| 
        cards << Card.new(number: number, suit: suit)        
      end
    end
    cards
  end

  def initialize_deck
    cards = []
    2.times { create_cards(cards) }
    cards.push(jokers).flatten
  end

  def jokers
    Array.new(4) { |i| Card.new(number: 'JO') }
  end
end