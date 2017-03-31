require 'byebug'
class Game
  attr_reader  :dictionary, :current_player, :previous_player
  attr_accessor :fragment

  def initialize(player1, player2, dictionary)
    @player1 = player1
    @player2 = player2
    @fragment = ''
    @dictionary = dictionary
    @current_player = player1 #nice if this could be randomly chosen
    @previous_player = player2 #not elegant to hardcode
  end

  def play_round
    until dictionary.include?(fragment)
      #player guesses
      #switch players
      guessed_letter = current_player.guess

      until valid_play?(guessed_letter)
        guessed_letter = current_player.guess
      end

      fragment << guessed_letter
      next_player!
    end

    puts "#{current_player.name} is winner"
    puts "The word: #{fragment}"
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def valid_play?(string)
    string.match(/[a-z]/) && dictionary.any? do |word|
      word.match(/^#{fragment + string}.*/)
    end
  end
end

class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def guess
    print " #{name} guess a letter: "
    gets.chomp
  end

  def alert_invalid_guess
    puts "Invalid letter"
  end
end

def read_dictionary(file)
  File.readlines(file).map(&:chomp)
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(Player.new("Tu"),Player.new("Leland"), read_dictionary("./dictionary.txt"))
  game.play_round
end
