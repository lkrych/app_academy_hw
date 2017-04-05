reqyure 'board'
class Piece
  attr_reader :piece_name
  def initialize(piece_name = "x", team = "black", start_pos = "", board)
    @piece_name = piece_name
    @team  = team
    @current_pos = start_pos
    @board = board
  end

  def valid_moves
  end

  def to_s
    @value.to_s
  end

  def team
    @team
  end

  def enemy?(other_piece)
    if other_piece.team != self.team
      return true unless other_piece.team == nil
    else
      return false
    end
  end

  def same_team?
    if other_piece.team == self.team
      return true
    else
      return false
    end
  end

  def get_new_position(current_pos,direction)
    [current_pos, direction].transpose.map { |x| x.inject(:+) }
  end

  def valid_move?(pos)
    return false unless board.in_bounds(pos)
    return false if same_team?(board[pos])
    true
  end

end

if __FILE__ == $PROGRAM_NAME


end
