
module Slideable

  def move
    output = []
    move_dirs.each do |direction|
      case direction
      when "right"
        right_positions = []
        (1..7).each do |i|
          if self[[self.position[0], self.position[1]+i]] == NullPiece.instance
            right_positions << [self.position[0], self.position[1]+i]
          else
            break 
          end
          # do this for all other directions in the Slideable module
          # calls on the [](position) method in the Piece class file
          # move this logic to checker helper method and call it in #move
        end
        output += right_positions
      when "left"
          left_positions = []
          (1..7).each do |i|
            left_positions << [self.position[0], self.position[1]-i]
          end
          output += left_positions
      when "up"
        up_positions = []
        (1..7).each do |i|
          up_positions << [self.position[0]+i, self.position[1]]
        end
        output += up_positions
      when "down"
        down_positions = []
        (1..7).each do |i|
          down_positions << [self.position[0]-i, self.position[1]]
        end
        output += down_positions
      when "leftup diagonal"
         ldu_positions = []
        (1..7).each do |i|
          ldu_positions << [self.position[0]-i, self.position[1]+i]
        end
        output += ldu_positions

      when "rightup diagonal"
          rdu_positions = []
          (1..7).each do |i|
            rdu_positions << [self.position[0]+i, self.position[1]+i]
          end
          output += rdu_positions
       when "leftdown diagonal"
            ldd_positions = []
            (1..7).each do |i|
              ldd_positions << [self.position[0]-i, self.position[1]-i]
            end
          output += ldd_positions
        when "rightdown diagonal"
            rdd_positions = []
            (1..7).each do |i|
              rdd_positions << [self.position[0]+i, self.position[1]-i]
            end
            output += rdd_positions
          
      end
    end
    output
  end

  def move_dirs
  end

  def grow_unblocked_moves_indir(dx,dy)
     
  end

  
end