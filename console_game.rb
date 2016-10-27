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
		if @current_player == player_1
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
        puts "Sample board with numbers:"
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
        counter = counter.to_i + 1
    end
end