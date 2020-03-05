require_relative "slideable"

class Bishop < Piece
  attr_reader :name, :color, :position
  include Slideable

  DIRS = ["leftup diagonal", "rightup diagonal", "leftdown diagonal",
     "rightdown diagonal"]



  def initialize(name, color, position)
    @name = name
    @color = color
    @position = position 
  end

  def move_dirs
   DIRS
  end
end