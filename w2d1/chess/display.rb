require_relative "board"
require_relative "cursor"
require "colorize"

class Display
  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.grid.each_with_index do |row, idx|
      row.each_with_index do |col, idx2|
        current_pos = [idx, idx2]
        if col.nil?
          if current_pos == @cursor_pos
            if @cursor.selected
              print " 0 ".colorize(:color => :red, :background => :blue)
            else
              print " 0 ".colorize(:red)
            end
          else
            print " 0 "
          end
        else
          if current_pos == @cursor_pos
            if @cursor.selected
              print " #{col.piece_name} ".colorize(:color => :red, :background => :blue)
            else
              print " #{col.piece_name} ".colorize(:red)
            end
          else
            print " #{col.piece_name} "
          end
        end
      end
      puts ""
    end
    puts ""
  end

  def move_cursor

    while true
      system("clear")
      render
      @cursor.get_input
      @cursor_pos = @cursor.cursor_pos
    end

  end


end
if __FILE__ == $PROGRAM_NAME
  new_display = Display.new([0,0], Board.new)
  new_display.render
  new_display.move_cursor
end
