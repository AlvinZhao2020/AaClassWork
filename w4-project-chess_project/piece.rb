require "singleton"

class Piece
  attr_reader :name, :color
  def initialize(name, color)
    @name = name
    @color = color   
  end

  # def move
  # end
end

class NullPiece < Piece
  include Singleton 
  def initialize
      
  end
  
end