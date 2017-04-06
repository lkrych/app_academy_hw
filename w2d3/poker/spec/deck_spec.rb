require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "starts with 52 cards" do
      expect(deck.cards.count).to eq(52)
    end
    it "has every card" do
      suits = [:club, :diamond, :heart, :spade]
      arr = []
      deck.cards.each do |card|
        if card.value.between?(2,14) && suits.include?(card.suit)
          arr << [card.suit, card.value]
        end
      end

      expect(arr.uniq.count).to eq(52)
    end

  end

  describe "#deal_hands" do
    before(:each) do
      @hands = deck.deal_hands(4)
    end

    it "should deal the correct amount of cards for four players" do
      expect(deck.cards.count).to eq(32)
    end

    it "should return an array with a length of the number of players" do
      expect(@hands.length).to eq(4)
    end

    it "should return hands with five cards" do
      expect(@hands.all? { |hand| hand.count == 5 }).to be true
    end
  end

  describe "#deal_card" do
    it "deals one card from the deck" do
      expect{deck.deal_card}.to change{deck.cards.length}.from(52).to(51)
    end

    it "returns the last card of the deck" do
      last_card = deck.cards.last
      new_card = deck.deal_card
      expect(new_card).to eq(last_card)
    end
  end

  describe "#shuffle!" do
    it "should rearrange cards in deck" do
      old_deck_first = deck.cards[0]
      deck.shuffle!
      expect(old_deck_first).to_not eq(deck.cards.first)
    end

    it "should not shuffle unless deck has 52 cards" do
      deck.cards.pop
      expect{deck.shuffle!}.to raise_error("Deck needs 52 cards to shuffle.")
    end
  end

end
