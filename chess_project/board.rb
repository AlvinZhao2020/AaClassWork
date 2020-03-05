require "byebug"

require_relative "piece"
require_relative "knight"
require_relative "king"
require_relative "rook"
require_relative "bishop"
require_relative "queen"

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
    current_piece = self[start_pos]
    if valid_pos?(start_pos) && valid_pos?(end_pos) && self[start_pos] != NullPiece.instance
      self[start_pos] = NullPiece.instance
      self[end_pos] = current_piece
    else
      raise "invalid position, input another position"
    end      
  end

  def place_piece
  
    wk1 = Knight.new("wn", "white", [7,2])
    wk2 = Knight.new("wn", "white", [7,5])
    self[wk1.position] = wk1 
    self[wk2.position] = wk2
    bk1 = Knight.new("bn","black" , [0,2])
    bk2 = Knight.new("bn","black",[0,5])
    self[bk1.position] = bk1 
    self[bk2.position] = bk2
    wking = King.new("wk","white" ,[7,4])
    bking = King.new("bk","black" ,[0,3])
    self[wking.position] = wking
    self[bking.position] = bking
    wrook1 = Rook.new("wr", "white", [7,0])
    wrook2 = Rook.new("wr", "white", [7,7])
    brook1 = Rook.new("br", "black", [0,0])
    brook2 = Rook.new("br", "black", [0,7])
    self[wrook1.position] = wrook1
    self[wrook2.position] = wrook2
    self[brook1.position] = brook1
    self[brook2.position] = brook2
    wbsp1=Bishop.new("wb","w",[0,1])
    wbsp2=Bishop.new("wb","w",[0,6])
    bbsp1=Bishop.new("bb","b",[7,1])
    bbsp2=Bishop.new("bb","b",[7,6])
    self[wbsp1.position] = wbsp1
    self[wbsp2.position] = wbsp2
    self[bbsp1.position] = bbsp1
    self[bbsp2.position] = bbsp2
    wq=Queen.new("wq","w",[0,4])
    bq= Queen.new("bq","b",[7,3])
    self[wq.position] = wq
    self[bq.position] = bq

  end


  def valid_pos?(pos)
    row,col = pos
    (row >= 0 && row <= 7 ) && (col >= 0 && col <= 7 )
  end
end

b = Board.new
b.print_board


b.print_board
# debugger
# p b[[0,2]].move #knight
# p b[[0,3]].move #king
# p b[[0,0]].move#rook
# p b[[0,1]].move #bishop
# p b[[0,4]].move #queen

