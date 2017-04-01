require_relative "tile"
require 'byebug'

class Board
  attr_reader :grid


  def self.fill_grid(bombs)
    new_board = Array.new(9) do
      Array.new(9)
    end

    new_board.each_index do |row|
      new_board.each_index do |col|
        new_board[row][col] = bombs.pop
      end
    end

    new_board
  end

  def initialize(bombs)
    @grid = self.class.fill_grid(bombs)
    @bomb_count = find_bomb_count
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def render
    grid.each do |row|
      row.each do |col|
        if col.safe
          print " " + @bomb_count[col].to_s + " "
        else
          print col.display
        end
      end
      puts ""
    end
  end

  def reveal(pos)
    self[pos].reveal
  end

  def find_bomb_count
    bomb_count = {}
    grid.each_with_index do |row, idx1|
      row.each_with_index do |tile, idx2|
        bomb_count[tile] = search_neighbors(idx1, idx2)
      end
    end
    bomb_count
  end

  def search_neighbors(row,col)
    count = 0
    (-1..1).each do |idxx|
      (-1..1).each do |idxy|
        search_pos = [row + idxx,col + idxy]
        if pos_valid?(search_pos) && is_bomb?(search_pos)
          count += 1
        end
      end
    end
    count
  end

  def pos_valid?(pos_arr)
    pos_arr.all? {|number| number < 9 && number > -1}
  end

  def is_bomb?(pos_arr)
    self[pos_arr].safe == false
  end

  def solved?
    #all non-bombs are revealed
  end

end

if __FILE__ == $PROGRAM_NAME
  a = Board.new()
  a.render
  a.class.fill_grid(1..81)
  a.render
end
