class TicTacToeBoard #naming the class
    attr_reader :board, :player_1, :player_2
    
    def initialize
        @board = Board.new
        @player_1 = Player.new
        @player_2 = Player.new
    end

    def player_names
        puts "Player 1 has entered the game!  Please enter your username" 
        @player_1.name = gets.chomp #collects user input of name and removed last element of string
        puts "Welcome #{@player_1}, you will be player X"
        puts "\n"
        @player_1.symbol = 'X' #sets player_1 symbol to X
        puts "Player 2 has entered the game!  Please enter your username" 
        @player_2.name = gets.chomp #collects user input of name and removed last element of string
        puts "Welcome #{@player_2}, you will be player O"
        puts "\n"
        @player_2.symbol = 'O' #sets player_1 symbol to O
        puts "\n"
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
    Player = Struct.new(:name, :symbol)


TicTacToeBoard.new.player_names.board.print_board
end
