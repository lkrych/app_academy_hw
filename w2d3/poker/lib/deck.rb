require_relative 'card'

class Deck

  attr_reader :cards

  def initialize
    @cards = Deck.make_deck
  end

  def self.make_deck
    cards = []
    suits = [:club, :diamond, :heart, :spade]
    values = (2..14).to_a
    suits.each do |suit|
      values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def shuffle!
    raise("Deck needs 52 cards to shuffle.") if cards.count != 52
    @cards.shuffle!
  end

  def deal_hands(num_players)
    hands = Array.new(num_players) {[]}
    5.times do
      hands.each do |hand|
        hand << self.deal_card
      end
    end
    hands
  end

  def deal_card
    @cards.pop
  end

end
