class Card

  attr_reader :value
  attr_accessor :face_up

  def initialize(value)
    @value = value
    @face_up = false #true is face up
  end

  def display
    if face_up
      " " + self.to_s + "  "
    else
      "Down"
    end
  end

  def hide
    self.face_up = false
  end

  def reveal
    self.face_up = true
  end

  def to_s
    value.to_s
  end

  def ==(other_card)
    other_card.to_s == self.to_s
  end
end
