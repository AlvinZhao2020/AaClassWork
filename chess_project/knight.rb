require_relative "stepable"
require_relative "piece"

class Knight < Piece
  attr_reader :name, :color, :position
  include Stepable
  All_MOVES = [
        [1,2],
        [1,-2],
        [-1,2],
        [-1,-2],
        [2,1],
        [-2,1],
        [2,-1],
        [-2,-1]
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