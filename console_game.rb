require_relative "board.rb"
require_relative "console_human.rb"

#gameplay functions

class ConsoleGame
    attr_accessor :board, :player_1, :player_2, :current_player

    def initialize(player_1, player_2)
        @board = Board.new
        @player_1 = player_1
        @player_2 = player_2
        @current_player = player_1
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
end