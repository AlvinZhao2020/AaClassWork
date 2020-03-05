
module Stepable

  def move
  
    start_pos = self.position
    x,y = start_pos

    move_diffs.map do |pos|
      a,b = pos
      [ (x + a) , (y + b)]
    end
  end

  

  def move_diffs
     
  end

end

