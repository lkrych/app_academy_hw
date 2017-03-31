require 'byebug'
class HumanPlayer

  def initialize(name)
    @name = name
  end

  def guess
    puts "Enter a position. Ex: 0,0"
    position = gets.chomp
    position.split(",").map(&:to_i)
  end

end


class ComputerPlayer

  attr_reader :memory
  attr_accessor :first_turn, :positions

  def initialize(name = "Hal")
    @name = name
    @memory = Hash.new { |h, k| h[k] = [] }
    @positions = nil
    @first_turn = true
  end

  def guess
    our_guess = nil
    if self.first_turn == true
      if memory.any? {|k,v| v.length == 2 }
        self.positions = memory.find {|k,v| v.length == 2 }[1]
        our_guess = self.positions[0]
      else
        our_guess = random_guess
      end
    else
      if !self.positions.nil?
        our_guess = self.positions[1]
        self.positions = nil
        memory.delete_if {|key,value| value.length == 2}
      else
        our_guess = random_guess
      end
    end

    if self.first_turn == true
      self.first_turn = false
    else
       self.first_turn = true
    end
    return our_guess
  end



  def random_guess
    guess = rand(0..3), rand(0..3)
    guess
  end

  def receive_revealed_card(card, position)
    unless memory[card].include?(position)
      @memory[card] << position
    end
  end

end




if __FILE__ == $PROGRAM_NAME
  hal = ComputerPlayer.new
  puts hal.class == ComputerPlayer
end
