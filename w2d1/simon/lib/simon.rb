class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    add_random_color
    show_sequence
    until game_over
      take_turn
      @sequence_length += 1
      round_success_message
    end
    game_over_message
    sleep(2)
    reset_game
  end

  def take_turn
    show_sequence
    sleep(1)
    system("clear")
    resp = require_sequence
    if resp != @seq
      @game_over = true
    end
  end

  def show_sequence
    add_random_color
    puts "#{@seq}"
  end

  def require_sequence
    puts "enter the sequence from newest to oldest"
    gets.split(" ")
  end

  def add_random_color
    @seq = @seq.unshift(COLORS.sample)
  end

  def round_success_message
    puts "Nice work! The new sequence is "
  end

  def game_over_message
    puts "Sorry, game over. Stick around if you want to play again."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []

  end
end

if __FILE__ == $PROGRAM_NAME
  n = Simon.new
  n.play
end
