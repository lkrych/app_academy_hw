require_relative "card"

class Board

  attr_reader :grid

  def create_grid
    Array.new(4) { Array.new(4) }  # should this be a class method?
  end

  def initialize
    @grid = create_grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value  # does this need self keyword?  when use self?
  end

  def populate
    card_arr = []
    2.times do
      8.times do |i|
        card_arr << Card.new(i + 1)
      end
    end

    card_arr.shuffle!

    4.times do |row|
      4.times do |col|
        pos = [row, col]
        self[pos] = card_arr.pop
      end
    end

  end

  def render
    system("clear")
    grid.each do |row|
      row.each do |card|
        print card.display + " | "
      end
      puts
    end
    puts
  end

  def won?
    grid.all? do |row|
      row.all? do |card|
        card.face_up
      end
    end
  end

  def reveal(guessed_pos)
    if self[guessed_pos].face_up
      puts "This card has already been revealed."

    else
      self[guessed_pos].reveal
    end
  end


end



if __FILE__ == $PROGRAM_NAME
  test_board = Board.new
  test_board.populate
  test_board.render
  test_board.reveal([0,0])
  test_board.render
  test_board.reveal([0,0])
end
