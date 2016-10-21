# def print_board#(positions)
#     positions = ["", "", "", "", "", "", "", "", "", ""]
#     puts " #{positions[1]} | #{positions[2]} | #{positions[3]} "
#     puts "-----------"
#     puts " #{positions[4]} | #{positions[5]} | #{positions[6]} "
#     puts "-----------"
#     puts " #{positions[7]} | #{positions[8]} | #{positions[9]} "
# end

# puts print_board

# def get_input
#     puts "What is your input?"
#     answer = gets
#     puts "answer = #{answer}"
#     position = answer[0]
#     player = answer[1]
#     puts "position = #{position}"
#     puts "player = #{player}"
# end

# def update_board1
#     positions = ["", "X", "", "", "", "", "", "", "", ""]
#     puts " #{positions[1]} | #{positions[2]} | #{positions[3]} "
#     puts "-----------"
#     puts " #{positions[4]} | #{positions[5]} | #{positions[6]} "
#     puts "-----------"
#     puts " #{positions[7]} | #{positions[8]} | #{positions[9]} "
# end

# puts get_input

# if get_input == 1
#     puts update_board1
# end


# # puts player

# #     puts firstmove

# # def update_board(updates)
# #     input.map!["", "", "", "", "", "", "", "", "", ""]
# # end

class TicTacToeBoard #naming the class
    attr_reader :board, :player1
    
    def initialize
        @board = Board.new
    end

    def player_names
        puts "Player 1 has entered the game!  Please enter your username" 
        @player_1.name = gets.chomp

    class Board
        attr_reader :board, :empty_cell

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
end


TicTacToeBoard.new.board.print_board
end
