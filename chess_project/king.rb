
require_relative "stepable"
require_relative "piece"

class King < Piece

  attr_reader :name, :color, :position
  include Stepable
   All_MOVES = [
      [-1,1],
      [0,1],
      [1,1],
      [-1,0],
      [-1,-1],
      [0,-1],
      [1,-1],
      [1,0]
      ]

  def initialize(name, color, position)
    @name = name
    @color = color
    @position = position

  end
   

  def move_diffs
      All_MOVES 
  end
end