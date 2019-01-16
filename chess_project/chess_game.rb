class Game 

    attr_reader :board, :display, :player1, :player2, :current_player

    def initialize(board, display, player1, player2)
        @board = board 
        @display = display 
        @player1 = player1
        @playe2 = player2
    end 

    def play 
        until #board.winner? 
            #move(current_player.get_move)
            swap_turn!
        end 
    end 

    private 

    def notify_players
        #
    end 

    def swap_turn!

    end 

end 