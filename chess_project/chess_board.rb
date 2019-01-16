require_relative "chess_piece"
require "byebug"

class Board 

  attr_reader :grid

  def initialize(grid = Array.new(8){Array.new(8)})
    @grid = grid
    setup_board
  end 

  def move_piece(start_pos, end_pos)
    raise ArgumentError if self[start_pos].is_a?(NullPiece)
    raise ArgumentError if !valid_move?(end_pos)

    self[end_pos] = self[start_pos]
    self[start_pos] = nil 
  end 

  def setup_board
    empty_rows = [2,3,4,5]
    white_rows = [0,1]
    black_rows = [6,7]

    (0..7).each do |i|
      (0..7).each do |j|
        pos = [i , j]

        if empty_rows.include?(i)
          self[pos] = NullPiece.instance
        elsif white_rows.include?(i)
          #piece = Piece.new(:white, self)
          self[pos] = Piece.generate(:white, self, pos)
          # self[pos] = self[pos].generate
          # self[pos].color = :white
        else 
          self[pos] = Piece.generate(:black, self, pos)
          # self[pos] = self[pos].generate
          # self[pos].color = :black
        end 
      end
    end
  end

  def [](pos)
    grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    # debugger 
    grid[pos[0]][pos[1]] = val
  end

  def valid_pos?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

  def valid_move?(pos)
    return true if self[pos].is_a?(NullPiece) && (pos[0] < 8 && pos[1] < 8)
    false
  end

  def add_piece(piece, pos)
  end
    
  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

end 