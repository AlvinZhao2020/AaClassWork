require_relative "slideable"

class  Queen < Piece
  attr_reader :name, :color, :position
  include Slideable

  DIRS = ["leftup diagonal", "rightup diagonal", "leftdown diagonal",
     "rightdown diagonal","right", "left", "up", "down"]



  def initialize(name, color, position)
    @name = name
    @color = color
    @position = position 
  end

  def move_dirs
   DIRS
  end
end