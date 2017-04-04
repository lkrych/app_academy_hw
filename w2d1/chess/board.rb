require 'byebug'
require_relative 'pieces/piece'


class Board
  attr_reader :grid
  def self.make_board
    Array.new(8) { Array.new(8) }
  end

  def self.populate_board(board)
    board.each_with_index do |row, i|
      row.each_with_index do |pos, i2|
        if i <= 1 || i >= 6
          board[i][i2] = Piece.new
        else
          board[i][i2] = nil
        end
      end
    end
    board
  end

  def initialize()
    blank_grid = Board.make_board
    @grid = Board.populate_board(blank_grid)
  end

  def [](pos)
    x,y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    begin
      valid_start_pos?(start_pos)
      valid_end_pos?(end_pos)
    rescue StandardError => e
      puts "#{e.message}"
      raise "Invalid Move"
    end
    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end

  def valid_start_pos?(start_pos)
    raise "No Piece here!" if self[start_pos].nil?
    true
  end

  def valid_end_pos?(end_pos)
    raise "You can't move here!" unless self[end_pos].nil?
    true
  end

  def in_bounds?(pos)
    return true if pos[0] >= 0 && pos[0] <= 7 && pos[1] >= 0 && pos[1] <= 7
    false
  end

end
