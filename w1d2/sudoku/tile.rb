require 'colorize'

class Tile
  attr_reader :value, :given

  def initialize(value, given)
    @value = value
    @given = given
  end

  def to_s
    if given
      value.to_s.colorize(:black)
    else
      value.to_s.colorize(:white)
    end
  end

end
