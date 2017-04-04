module SteppingPiece
  DIRECTIONS = {:straight => [[1,0],[0,1],[-1,0],[0,-1]],
                :jump => [[2,1], [2,-1], [-2,-1],[2,-1], [1,2], [1,-2], [-1,2], [-1,-2]] }
  def moves(directions)
    possible_moves = []
    directions.each do |direction|
      new_pos = get_new_position(@current_pos, dir)
      if valid_move?(new_pos)
        possible_moves << new_pos
      end
    end
    possible_moves
  end

  def move_dirs(type)
    move_dir = {:king => DIRECTIONS[:straight],
                :knight => DIRECTIONS[:jump] }
    move_dir[type]

  end

end
