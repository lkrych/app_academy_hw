require "rspec"
require 'hand'

describe Hand do
  #Cannot access let variables inside of a describe block
  #Can only access from inside an it block
  #error when tried to access ace in hand_hash

  # let(:ten) {double("ten", :value => 10)}
  # let(:jack) {double("jack", :value => 11)}
  # let(:queen) {double("queen", :value => 12)}
  # let(:king) {double("king", :value => 13)}
  # let(:ace) {double("ace", :value => 14)}
  # hand_hash = {
  #   pair_hand: [ace, ace, king, queen, jack],
  #   two_pair_hand: [ace, ace, king, king, queen],
  #   three_of_a_kind_hand: [ace, ace, ace, king, queen],
  #   straight_hand: [ten, jack, queen, king, ace]
  # }

  let(:hand_hash) do
    ten = double("ten", :value => 10)
    jack = double("jack", :value => 11)
    queen = double("queen", :value => 12)
    king = double("king", :value => 13)
    ace = double("ace", :value => 14)
    {
    pair_hand: [ace, ace, king, queen, jack],
    two_pair_hand: [ace, ace, king, king, queen],
    three_of_a_kind_hand: [ace, ace, ace, king, queen],
    straight_hand: [ten, jack, queen, king, ace]
  }
  end

  describe "#initialize" do
    subject(:hand) {Hand.new(hand_hash[:pair_hand])}

    it "initializes with an array of five cards" do
      expect(hand.cards.count).to eq(5)
    end
  end

  describe "#pair?" do
    subject(:pair_hand) {Hand.new(hand_hash[:pair_hand])}
    let(:straight_hand) {Hand.new(hand_hash[:straight_hand])}

    it "should return true if the hand has a pair" do
      expect(pair_hand.pair?).to be true
    end

    it "should return false if the hand does not have a pair" do
      expect(straight_hand.pair?).to be false
    end
  end

  describe "#two_pair?" do
    let(:two_pair_hand) {Hand.new(hand_hash[:two_pair_hand])}
    let(:pair_hand) {Hand.new(hand_hash[:pair_hand])}

    it "should return true if the hand has a two pair" do
      expect(two_pair_hand.two_pair?).to be true
    end

    it "should return false if the hand does not have a two pair" do
      expect(pair_hand.two_pair?).to be false
    end
  end

  describe "#three_of_a_kind?" do
    let(:three_of_a_kind_hand) {Hand.new(hand_hash[:three_of_a_kind_hand])}
    let(:pair_hand) {Hand.new(hand_hash[:pair_hand])}

    it "should return true if the hand has a three-of-a-kind" do
      expect(three_of_a_kind_hand.three_of_a_kind?).to be true
    end

    it "should return false if the hand does not have a three-of-a-kind" do
      expect(pair_hand.three_of_a_kind?).to be false
    end
  end
end
