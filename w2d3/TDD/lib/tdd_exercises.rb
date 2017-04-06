require 'byebug'

class Array
  def my_uniq
    result = []
    each { |el| result << el unless result.include?(el)}
    result
  end

  def two_sum
    result = []
    (0..size-2).each do |idx1|
      ((idx1 + 1)..size-1).each do |idx2|
        result << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    result
  end
end

def my_transpose(matrix)
  transposed_matrix = Array.new(matrix.first.length) {[]}
  matrix.each_with_index do |row, row_idx|
    row.each_with_index do |col, col_idx|
      transposed_matrix[col_idx] << col
    end
  end
  transposed_matrix
end

def stock_picker(price_arr)
  buy_sell_day = []
  max_diff = 0
  (0..(price_arr.size-2)).each do |idx1|
    ((idx1 + 1)..(price_arr.size-1)).each do |idx2|
      diff = price_arr[idx2] - price_arr[idx1]
      if diff > max_diff
        max_diff = diff
        buy_sell_day = [idx1+1, idx2+1]
      end
    end
  end
  buy_sell_day
end

class TowersOfHanoi
  attr_accessor :towers
  def initialize
    @towers = [[3,2,1], [], []]
  end

  def move(from, to)
    raise "That is the same tower." if from == to
    raise "That stone doesn't exist." if towers[from].empty?
    unless towers[to].last.nil?
      if towers[from].last > towers[to].last
        raise "Can't move a larger stone on top of a smaller stone."
      end
    end

    towers[to] << towers[from].pop
  end

  def won?
    return true if towers[1] == [3,2,1] || towers[2] == [3,2,1]
    false
  end

  def display_towers
    puts "#{towers}"
  end

  def play_game
    until won?
      begin
        display_towers
        puts "What tower do you want to move from?"
        from = gets.chomp.to_i
        puts "What tower do you want to move to?"
        to = gets.chomp.to_i
        move(from, to)
      rescue => e
        puts e.message.to_s
        retry
      end
    end
    puts "You won!"
  end

end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play_game
end
