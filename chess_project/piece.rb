require "singleton"

class Piece
  attr_reader :name, :color
  attr_accessor :position

  def initialize(name, color, position)
    @name = name
    @color = color
    @position = position  
  end

  def move
  end

  def to_s
    "this is #{self.name} and it's color is #{self.color} it's position is #{self.pos}"
    # come back
  end

  def [](pos)
    return self if pos == @position
  end

  def empty?
  end


end

class NullPiece < Piece
  include Singleton 
  def initialize
      
  end
  
end