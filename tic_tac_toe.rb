class TicTacToeBoard #naming the class
    attr_reader :board, :player1
    
    def initialize
        @board = Board.new
    end

    def player_names
        puts "Player 1 has entered the game!  Please enter your username" 
        @player_1.name = gets.chomp
    end

    class Board
        attr_reader :board, :empty_square

        def initialize
            @empty_square = "-" #if the square has not been played it is empty
            @board = Array.new(9, @empty_square) #makes an array of 9 " "'s
        end
        
        def print_board #prints 3 rows in 3 columns with | between the columns
            puts "\n"
            @board.each_slice(3) {|row| puts row.join(' | ')}  #breaks @board into sections of 3 and puts a new line between each section
            puts "\n"
        end
    end


TicTacToeBoard.new.board.print_board
end
