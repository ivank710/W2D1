require_relative "chess_board"

class Piece 

  attr_reader :color, :board, :pos 

  def initialize
    # @color = color 

    # @pos = pos
  end 

  def to_s     
  end 

  def empty? 
  end 

  def valid_moves 
  end 

  def pos=(value)
  end 

  def symbol 
  end 

  private 

  def move_into_check?(end_pos)
  end 

end 

class NullPiece < Piece

  def moves 
  end 

  def symbol 
    # :null 
  end 

end 