module SlidingPiece
  DIRECTIONS = {:straight => [[1,0],[0,1],[-1,0],[0,-1]],
     :diagonal => [[1,1], [-1,-1], [1,-1],[-1,1]]}
  def moves(directions)
    possible_moves = []
    directions.each do |direction|
      new_pos = get_new_position(@current_pos, dir)
      if valid_move?(new_pos)
        possible_moves << new_pos
        while valid_move?(new_pos)
          new_pos = get_new_position(@current_pos, dir)
          possible_moves << new_pos
          if enemy?(@board[new_pos])
            break
          end
        end
      end
    end
    possible_moves
  end

  def move_dirs(type)
    move_dir = {:queen => [DIRECTIONS[:straight],DIRECTIONS[:diagonal]].flatten,
                :bishop => DIRECTIONS[:diagonal],
                :rook => DIRECTIONS[:straight]}
    move_dir[type]
  end
end
