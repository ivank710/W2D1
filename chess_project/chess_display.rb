require "colorize"
require_relative "chess_cursor"
require_relative "chess_board"
require "byebug"

class Display
  COLORS = [:red, :light_blue, :yellow]
  attr_reader :board, :cursor 

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render_cursor
    input = @cursor.get_input
    until input == Process.exit(0)
      render
    end
  end

  def render
    (0..7).each do |i|
      (0..7).each do |j|
        piece = board[[i,j]]
        if [i,j] == cursor.cursor_pos
          print "#{piece}".colorize(:color => piece.color, :background => COLORS[0])
        elsif (i + j) % 2 == 0 
          print "#{piece}".colorize(:color => piece.color, :background => COLORS[1])
        else 
          print "#{piece}".colorize(:color => piece.color, :background => COLORS[2])
        end 
      end 
      print "\n"
    end 
  end

end

if __FILE__ == $PROGRAM_NAME 
  b = Board.new 
  d = Display.new(b)
  while true 
    system("clear")
    d.render 
    d.cursor.get_input 
  end 
end