require_relative "piece"
require "byebug"

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    self.place_piece
  end

  def [](position)
    row, col = position
    self.grid[row][col]
  end

  def []=(position, piece)
    row, col = position
    self.grid[row][col] = piece
  end

  def print_board
    print "-"*41+ "\n"
    @grid.each do |row|
      p_row = row.map{|piece| piece == NullPiece.instance  ?    " "*2 : piece.name[0..1]}
      print "| " + p_row.join(" | ") + " |"  + "\n"
      print  "-"*41
      puts
    end
  end

  def move_piece(start_pos, end_pos)
    debugger
    current_piece = self.grid[0][0]
    if valid_pos?(start_pos) && valid_pos?(end_pos) && self.grid[start_pos] != NullPiece.instance
      self.grid[start_pos] = NullPiece.instance
      self.grid[end_pos] = current_piece
    else
      raise "invalid position, input another position"
    end      
  end

  # MOVE_PIECE DOESN'T WORK

  def place_piece
   
    self.grid[0].map!{|pos| Piece.new("name", "white")}
    self.grid[1].map!{|pos| Piece.new("name", "white")}
    self.grid[6].map!{|pos| Piece.new("name", "black")}
    self.grid[7].map!{|pos| Piece.new("name", "black")}
  end


  def valid_pos?(pos)
    row,col = pos
    (row >= 0 && row <= 7 ) && (col >= 0 && col <= 7 )
  end
end

b = Board.new
b.print_board
b.move_piece([0,0], [5,5])
b.print_board