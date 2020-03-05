class Pawn < Piece
  attr_reader :name, :color
  attr_accessor :position

  def initialize(name, color, position)
    @name = name
    @color = color
    @position = position
  end

 

end