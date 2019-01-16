require_relative "chess_board"
require_relative "sliding_stepping"
require 'singleton'

class Piece 
  # include SlidingPiece
  # include SteppingPiece

  attr_reader :color, :board, :pos, :moves_array

  def initialize(color = nil, board)
    @color = color 
    @moves_array = Array.new
    @pos = [nil, nil]
    @board = board
  end 

  def to_s   
    hsh = {
      :king => " ♚ ",
      :queen => " ♛ ",
      :bishop => " ♝ ",
      :knight => " ♞ ",
      :rook => " ♜ ",
      :pawn => " ♟ "
    }

    return hsh[self.symbol]
  end 

  def self.generate(color, board, pos)
    pawn_pos = [[1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7], 
    [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7]]
    rook_pos = [[0, 0], [0, 7], [7, 0], [7, 7]]
    knight_pos = [[0, 1], [0, 6], [7, 1], [7, 6]]
    bishop_pos = [[0, 2], [0, 5], [7, 2], [7, 5]]
    queen_pos = [[0, 3], [7, 3]]
    king_pos = [[7, 4], [0, 4]]
    

    return Pawn.new(color, board) if pawn_pos.include?(pos)
    return Rook.new(color, board) if rook_pos.include?(pos)
    return Knight.new(color, board) if knight_pos.include?(pos)
    return Bishop.new(color, board) if bishop_pos.include?(pos)
    return Queen.new(color, board) if queen_pos.include?(pos)
    return King.new(color, board) if king_pos.include?(pos)
  end

  def empty? 
  end 

  def moves
    moves_array 
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
  include Singleton 

  def initialize
    super()
  end

  def symbol 
    # :null 
  end 

  def to_s 
    "   "
  end 

end 

class Rook < Piece
  attr_reader :symbol

  def initialize
    @symbol = :rook
    super()
  end

  def move_dirs
    horizontal_dirs
  end

end

class Bishop < Piece

  def initialize
    @symbol = :bishop
    super()
  end

  def move_dirs
    diagonal_dirs 
  end
  
end

class Queen < Piece

  def initialize
    @symbol = :queen
    super()
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end

class Knight < Piece
  def initialize
    @symbol = :knight
    super()
  end

  def move_diffs

  end
end

class King < Piece

  def initialize
    @symbol = :king
    super()
  end

  def move_diffs
    horizontal_dirs + diagonal_dirs
  end

end

class Pawn < Piece

  def initialize
    @symbol = :pawn
    super()
  end

  def move_dirs

  end

end