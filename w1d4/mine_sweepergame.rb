require_relative 'board'
require_relative 'tile'
require 'byebug'

class Game

  attr_reader :board

  def self.tile_array
    bomb_container = []
    71.times { bomb_container << Tile.new(true) }
    10.times { bomb_container << Tile.new(false) }
    bomb_container.shuffle
  end

  def initialize(bombs = self.class.tile_array)
    @board = Board.new(bombs)
  end

  def run
    until board.solved?
      board.render
      puts "Please enter in coordinates, Ex: 0,0"
      guess = gets.chomp.split(",").map(&:to_i)
      board.reveal(guess)
    end
  end


end


if __FILE__ == $PROGRAM_NAME
  board = Game.new
  board.run


end
