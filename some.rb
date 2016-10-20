class Game
    attr_reader :grid, :player_1, :player_2
    
    @@wins = [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]] # winning combos
    
    def initialize
        @grid = Board.new
        @player_1 = Player.new
        @player_2 = Player.new
        @winner = nil
        @current_turn = 1
    end
    
    def play # just a function to call other functions in an order
        show_welcome_message
        get_players_names
        start_playing
        show_result
        show_game_over_message
    end

    def show_welcome_message
        puts "\n"
        puts "\n"
        puts "------------------------------------"
        puts "Welcome to the best TicTacToe Game!!"
        puts "------------------------------------"
        puts "\n"
        puts "\n"
    end
    
    def get_players_names
        print "Player 1, Please enter your name: " # prompts for user input on screen
        @player_1.name = gets.chomp # collects user input and cuts off the last element in the string
        puts "You will be player X"
        puts "\n"
        sleep(1) # adds 1 sec before printing player 2 question
        @player_1.symbol = 'X' # assigns player_1 to x
        print "Player 2, Please enter your name: "
        @player_2.name = gets.chomp
        puts "You will be player O"
        @player_2.symbol = 'O'
        puts "\n"
    end
    
    def start_playing
        sleep(1)
        puts "#{@player_1.name}, we will start with you."
        @grid.print_grid # initializes a new game Board and call on the print_grid function in that Board class
        take_turns until game_over # calls take_turns function until the game is over and then calls game_over function
    end
    
    def take_turns
        @current_turn.odd? ? turn(@player_1) : turn(@player_2) # initializes current_turn which starts out set to 1. checks to see if it is odd then calls the turn function and passes player 1 if it is or player 2 if it is not.
    end
    
    def turn(player)
        show_turn(player) # calls function bringing back the current player and their symbol
        input = get_valid_cell # sets input to the get_valid_cell function
        if @grid.update(input, player.symbol) # if grid.update (calls update function) with a valid cell and the current players symbol then it will set current_turn equal to current_turn plus 1 or if it is not a valid location (spot is taken) returns an error
            @current_turn += 1 # sets current_turn equal to current_turn plus 1
        else
            error = "SORRY, THAT CELL IS TAKEN"
        end
        @grid.print_grid # calls the current game board again
        puts error # puts the error under the current game board
        check_for_win(player) # calls check_for_win function and passes the current player
    end
    
    def show_turn(player)
        print "#{player.name} ('#{player.symbol}') "
    end
    
    # user validation: requires user to input 1-9
    def get_valid_cell
        input = nil
        until (0..8).include?(input)
            print 'enter your move (1-9) top to bottom, left to right: '
            input = gets.chomp.to_i - 1 # array is indexed 0-8; positionitions are 1-9
        end
        input
    end
    
    # searches winning combos and assigns winner to current player
    def check_for_win(player)
        @@wins.each do |w|
            @winner = player if w.all? { |a| @grid.board[a] == player.symbol }
        end
    end
    
    def game_over
        @current_turn > 9 || @winner
    end
    
    def show_game_over_message
        puts '---------'
        puts 'Game Over'
        puts '---------'
    end
    
    def show_result
        if @current_turn > 9 && !@winner
            puts "IT'S A TIE!"
        else
            puts "CONGRATS, #{@winner.name}.  YOU WON!"
        end
    end
    
    class Board
        attr_reader :board, :empty_cell # sets a variable as an attribute that can be read when called
        
        def initialize
            @empty_cell = '-' # sets empty_cell as placeholder for empty cells
            @board = Array.new(9, @empty_cell) # creats a 9 element array of "-"
        end

        def print_grid # prints 3 X 3 grid with "-" as placeholders
            puts "\n"
            @board.each_slice(3) {|row| puts row.join(' | ')} # breaks the elements into blocks of 3 and puts each block on a new line adds a string of " | " between each element on each new line
            puts "\n"
        end

        def update(position, symbol)
            if @board[position] == @empty_cell
                @board[position] = symbol
                return true
            else
                return false
            end
        end
    end

    Player = Struct.new(:name, :symbol) # i have no idea what this does. i do know if i take it out the game will not work
end

my_game = Game.new # sets a new Game class to new_game
my_game.play # hits the Board class and calls the print_board