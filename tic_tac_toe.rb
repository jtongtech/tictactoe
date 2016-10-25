class Game #names the class
    attr_reader :grid, :player_1, :player_2 #sets attributes for the class
    
    @@wins = [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    def initialize
        @grid = Board.new
        @player_1 = Player.new
        @player_2 = Player.new
        @current_turn = 1
        @winner = nil
    end

    def play_game #this calls all of the other function to run the game
        welcome
        player_names
        begin_game
        result
        game_over_display
    end

    def welcome
        puts "\n"
        puts "****************************************"
        puts "* Welcome to Jeremy's Tic-Tac-Toe Game *"
        puts "****************************************"
    end

    def player_names
        puts "Player 1 has entered the game!  Please enter your username" 
        @player_1.name = gets.chomp #collects user input of name and removed last element of string
        puts "Welcome #{@player_1.name}, you will be player X"
        puts "\n"
        @player_1.symbol = 'X' #sets player_1 symbol to X
        puts "Player 2 has entered the game!  Please enter your username" 
        @player_2.name = gets.chomp #collects user input of name and removed last element of string
        puts "Welcome #{@player_2.name}, you will be player O"
        puts "\n"
        @player_2.symbol = 'O' #sets player_1 symbol to O
        puts "\n"
    end

    def begin_game
        puts "#{@player_1.name}, it is your turn."
        @grid.print_grid #begins a new game!
        take_turns until game_over
    end 

    def take_turns
        @current_turn.odd? ? turn(@player_1) : turn(@player_2) #if it is an odd turn it goes to player 1 and even goes to player 2
    end

    def turn(player)
        show_turn(player)
        input = get_valid_square
        if @grid.update(input, player.symbol)
            @current_turn += 1
        else
            error = "That square has already been played.  Please try to pay closer attention in the future."
        end
        @grid.print_grid
        puts error
        winner(player)
        end
    
    def show_turn(player)
    puts "#{player.name} ('#{player.symbol}')"
    end

    def get_valid_square
        input = nil
        until (0..8).include?(input)
            puts "Make your move.  1-3 is top row, left to right.  4-6 is the middle row, and 7-9 is the bottom:"
            input = gets.chomp.to_i - 1
        end
        input
    end

    def winner(player)
        @@wins.each do |w|
            @winner = player if w.all? {|a| @grid.board[a] == player.symbol}
        end
    end

    def game_over
        @current_turn > 9 || @winner
    end

    def game_over_display
        puts "          *************"
        puts "          **Game Over**"
        puts "          *************"
    end

    def result
        if @current_turn > 9 and !@winner
            puts "Cat wins!"
        else
            puts "Congratulations!  #{@winner.name} reigns victorious!"
        end
    end

    class Board
        attr_reader :board, :empty_square

        def initialize
            @empty_square = "-" #if the square has not been played it is empty
            #@board = Array.new(9, @empty_square) #makes an array of 9 " "'s
            @board = Array.new(9, @empty_square)
        end
        
        def print_grid #prints 3 rows in 3 columns with | between the columns
            puts "\n"
            @board.each_slice(3) {|row| puts row.join(' | ')}  #breaks @board into sections of 3 and puts a new line between each section
            puts "\n"
        end
        def update(position, symbol) #this is how to space is updated
            if @board[position] == @empty_square
                @board[position] = symbol
                return true
            else
                return false
            end
        end
    end
    Player = Struct.new(:name, :symbol)
end

Game.new.play_game
