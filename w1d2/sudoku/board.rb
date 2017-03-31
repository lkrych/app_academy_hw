class Board

  attr_reader :grid

  def initialize(grid)
    @grid = Array.new(3) {Array.new(3)}
  end

  def Board.from_file(file)
    contents = File.readLines(file)

    contents.map(&:chomp)

    contents.each_with_index do |tile, idx|
      

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end




end
