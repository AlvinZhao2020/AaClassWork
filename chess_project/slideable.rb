
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
             right_positions << [self.position[0], self.position[1]+i]
            break 
          end
        end
        output += right_positions
      when "left"
          left_positions = []
          (1..7).each do |i|
            left_positions << [self.position[0], self.position[1]-i]
            break unless self[[self.position[0], self.position[1]-i]] == NullPiece.instance
          end
          output += left_positions
      when "up"
        up_positions = []
        (1..7).each do |i|
          up_positions << [self.position[0]+i, self.position[1]]
          if self[[self.position[0]+i, self.position[1]]] != NullPiece.instance
            break
          end
        end
        output += up_positions
      when "down"
        down_positions = []
        (1..7).each do |i|
          if self[[self.position[0]-i, self.position[1]]] == NullPiece.instance
            down_positions << [self.position[0]-i, self.position[1]]
          else
            down_positions << [self.position[0]-i, self.position[1]]
            break
          end
        end
        output += down_positions
      when "leftup diagonal"
        ldu_positions = []
        (1..7).each do |i|
          if self[[self.position[0]-i, self.position[1]+i]] == NullPiece.instance
            ldu_positions << [self.position[0]-i, self.position[1]+i]
          else
            ldu_positions << [self.position[0]-i, self.position[1]+i]
            break
          end
        end
        output += ldu_positions

      when "rightup diagonal"
          rdu_positions = []
          (1..7).each do |i|
            if self[[self.position[0]+i, self.position[1]+i]] == NullPiece.instance
              rdu_positions << [self.position[0]+i, self.position[1]+i]
            else
              rdu_positions << [self.position[0]+i, self.position[1]+i]
              break
            end
          end
          output += rdu_positions
       when "leftdown diagonal"
            ldd_positions = []
            (1..7).each do |i|
            if self[[self.position[0]-i, self.position[1]-i]] == NullPiece.instance
              ldd_positions << [self.position[0]-i, self.position[1]-i]
            else
              ldd_positions << [self.position[0]-i, self.position[1]-i]
              break
            end
          end
          output += ldd_positions
        when "rightdown diagonal"
            rdd_positions = []
            (1..7).each do |i|
              if self[[self.position[0]+i, self.position[1]-i]] == NullPiece.instance
                rdd_positions << [self.position[0]+i, self.position[1]-i]
              else
                rdd_positions << [self.position[0]+i, self.position[1]-i]
                break
              end
            end
            output += rdd_positions        
      end
    end
    output
  end

  def move_dirs
  end
end