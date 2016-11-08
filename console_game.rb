require_relative "board.rb"
require_relative "console_human.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "unbeatable_ai.rb"

class Game
    attr_accessor :board, :player_1, :player_2, :current_player

    def initialize
        @board = Board.new
        @player_1 = Human.new("x")
        @player_2 = select_player_2
        @current_player = player_2
    end

    def select_player_2
        puts """

            Who would you like to play against?

            Press   1 - Human
                    2 - Random AI
                    3 - Sequential AI
                    4 - Unbeatable AI
                    
            Then ENTER!

        """
        who = {1 => Human, 2 => RandomAi, 3 => SequentialAi, 4 => UnbeatableAi}
        choice = gets.chomp.to_i
        player = who[choice].new("o")    
    end

    def change_player
        if current_player == player_1
            @current_player = player_2
        else
            @current_player = player_1
        end
    end

    def print_board
        puts """
        
    Let's get started!

    Sample board with numbers:
        
     1 | 2 | 3
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9
        
    Game Board:
        
     #{board.board[0]} | #{board.board[1]} | #{board.board[2]}
    -----------
     #{board.board[3]} | #{board.board[4]} | #{board.board[5]}
    -----------
     #{board.board[6]} | #{board.board[7]} | #{board.board[8]}

    #{current_player.marker} --- Its your move
        
        """
    end

    def get_move
        current_player.get_move(board.board)
    end

    def make_move(move)
        board.update(move, current_player.marker)
    end

    def game_over?
        board.winner?(current_player.marker) ||  board.full_board?        
    end

    def end_message
        if board.winner?(current_player.marker)
            puts "#{current_player.marker} wins!"
        else
            board.full_board?
            puts  "You tied!"
        end
    end
end