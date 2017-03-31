require_relative "board"
require_relative "player"
require_relative "card"
require "byebug"

class Game
  attr_reader :board, :player
  attr_accessor :previous_guess

  def initialize(player)
    @player = player
    @board = Board.new
    @previous_guess = nil
  end

  def cards_match(pos1,pos2)
    board[pos1] == board[pos2]
  end

  def update_memory(position)
    if player.class == ComputerPlayer
      player.receive_revealed_card(board[position].to_s, position)
    end
  end

  def get_guess
    position1 = player.guess
    while board[position1].face_up
      puts "That card is already face up."
      position1 = player.guess
    end
    update_memory(position1)
    board.reveal(position1)
    board.render

    position2 = player.guess

    puts "Make your second guess."
    while board[position2].face_up
      puts "That card is already face up."
      position2 = player.guess
    end
    update_memory(position2)
    board.reveal(position2)
    board.render
    # byebug
    # sleep(3)
    return [position1, position2]
  end

  def play
    board.populate
    until board.won?
      board.render
       #allow player to guess two positions on board
      pos1, pos2 = get_guess

      unless cards_match(pos1, pos2)
        board[pos1].hide
        board[pos2].hide
      end

    end
    puts "You won!"
    sleep(3)
    system("clear")
  end

end

if __FILE__ == $PROGRAM_NAME
  test_game = Game.new(ComputerPlayer.new("Elaine"))
  test_game.play
end
