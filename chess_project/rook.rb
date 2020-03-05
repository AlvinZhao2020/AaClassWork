require_relative "slideable"

class Rook < Piece
  attr_reader :name, :color, :position
  include Slideable

  DIRS = ["right", "left", "up", "down"]



  def initialize(name, color, position)
    @name = name
    @color = color
    @position = position 
  end

  def move_dirs
    DIRS
  end
end