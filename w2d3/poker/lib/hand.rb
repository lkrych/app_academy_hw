class Hand

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def pair?
  end



  def two_pair?
  end

  def three_of_a_kind?
  end

  private

  CARD_LENGTH_HASH = {
    2: [:four_of_a_kind, :full_house],
    3: [:three_of_a_kind, :two_pair],
    4: [:pair],
    5: [:crap, :straight, :flush, :straight_flush]}

  def check_cards
    value_hash = Hash.new {|h,k| h[k] = []}
    suit_hash = Hash.new {|h,k| h[k] = []}
    cards.each do |card|
      if value_hash.value?(card.value)
        value_hash[card.value] += 1
      else
        value_hash[card.value] = 1
      end

      if suit_hash.value?(card.suit)
        suit_hash[card.suit] += 1
      else
        suit_hash[card.suit] = 1
      end
    end



  end

end
