require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new(:spade, 7) }
  describe "#initialize" do

    it "should be assigned a suit" do
      expect(card.suit).to eq(:spade)
    end
    it "should be assigned a value" do
      expect(card.value).to eq(7)
    end
  end
end
