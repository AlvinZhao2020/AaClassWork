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
    raise StantardError
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