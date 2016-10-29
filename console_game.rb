require_relative "board.rb"
require_relative "console_human.rb"


#gameplay functions

class ConsoleGame
    attr_accessor :board, :player_1, :player_2, :current_player, :current_turn, :counter

    def initialize(player_1, player_2)
        @board = Board.new
        @player_1 = player_1
        @player_2 = player_2
        @current_player = player_1
        @current_turn = 1
        @counter = 1

    end

   def change_player
        if current_player == player_1
            @current_player = player_2
        else
            @current_player = player_1
        end
    end

    def board_status()
	 	puts " #{board.position_board[0]} | #{board.position_board[1]} | #{board.position_board[2]} "
	 	puts "-----------"
	 	puts " #{board.position_board[3]} | #{board.position_board[4]} | #{board.position_board[5]} "
	 	puts "-----------"
	 	puts " #{board.position_board[6]} | #{board.position_board[7]} | #{board.position_board[8]} "
	 	puts

	 	"#{change_player}"

	 	if board.winner?(current_player.symbol) == false && board.full_board? == false
			puts "It is #{player.symbol} turn."
		end	
	end

    def print_board
        puts ""
        puts "Let's get started!'"
        puts ""
        puts "Game board with numbers:"
        puts ""
        puts " 1 | 2 | 3 "
        puts "---+---+---"
        puts " 4 | 5 | 6 "
        puts "---+---+---"
        puts " 7 | 8 | 9 "
        puts ""
        puts "Game Board:"
        puts ""
        puts " #{board.position_board[1]} | #{board.position_board[2]} | #{board.position_board[3]} "
        puts "---+---+---"
        puts " #{board.position_board[4]} | #{board.position_board[5]} | #{board.position_board[6]} "
        puts "---+---+---"
        puts " #{board.position_board[7]} | #{board.position_board[8]} | #{board.position_board[9]} "
        puts ""
    end
    #need a few more methods in this class

    def get_move
        current_player.get_move(board.position_board)
    end

    def make_move(move)
        board.update(move, current_player.marker)
    end
    
    def game_over?
        if board.full_board?(board.position_board)
            puts "You tied!"
        elsif
            board.winner?(board.position_board)
            puts "#{current_player} wins!"
        end
    end
end

# require_relative "board.rb"
# require_relative "console_human.rb"
# require_relative "random_ai.rb"
# require_relative "sequential_ai.rb"

# class Game
#     attr_accessor :board, :player_1, :player_2, :current_player

#     def initialize(player_1, player_2)
#         @board = Board.new
#         @player_1 = player_1
#         @player_2 = player_2
#         @current_player = player_2
#     end

#     def change_player
#         if current_player == player_1
#             @current_player = player_2
#         else
#             @current_player = player_1
#         end
#     end

#     def print_board
#         puts """
        
#     Let's get started!

#     Sample board with numbers:
        
#      1 | 2 | 3
#     ---+---+---
#      4 | 5 | 6
#     ---+---+---
#      7 | 8 | 9
        
#     Game Board:
        
#     #{board.board[0]} | #{board.board[1]} | #{board.board[2]}
#     ---------
#     #{board.board[3]} | #{board.board[4]} | #{board.board[5]}
#     ---------
#     #{board.board[6]} | #{board.board[7]} | #{board.board[8]}

#     #{current_player.marker} --- Its your move
        
#         """
#     end

#     def get_move
#         current_player.get_move(board.board)
#     end

#     def make_move(move)
#         board.update(move, current_player.marker)
#     end

#     def game_over?
#         board.winner?(current_player.marker) ||  board.full_board?        
#     end

#     def end_message
#         if board.winner?(current_player.marker)
#             puts "#{current_player.marker} wins!"
#         else
#             board.full_board?
#             puts  "You tied!"
#         end
#     end
# end