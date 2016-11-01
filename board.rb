   class Board
        attr_accessor :position_board, :update, :empty_square

        def initialize
            @empty_square = "" #if the square has not been played it is empty
            #@board = Array.new(9, @empty_square) #makes an array of 9 " "'s
            @position_board = Array.new(10, "")
        end
        
        def update(position, symbol) #this is how to space is updated
            @position_board[position.to_i] = symbol
        end
        
        def valid_space?(position)
            if @position_board[position.to_i] != ""
                false
            else
                true
            end
        end
        def valid_input?(position)
            if position =~ /^[0-8]/ && position.to_i >= 1 && position.to_i <= 8 && position =~ (/\d/)
                true
            else
                false
            end
        end
        def full_board?
            position_board.count("") == 0
        end

def winner?(symbol)
            position_board[0] == symbol && position_board[1] == symbol && position_board[2] == symbol || position_board[3] == symbol && position_board[4] == symbol && position_board[5] == symbol || position_board[6] == symbol && position_board[7] == symbol && position_board[8] == symbol || position_board[0] == symbol && position_board[3] == symbol && position_board[6] == symbol || position_board[1] == symbol && position_board[4] == symbol && position_board[7] == symbol || position_board[2] == symbol && position_board[5] == symbol && position_board[8] == symbol || position_board[0] == symbol && position_board[4] == symbol && position_board[8] == symbol || position_board[2] == symbol && position_board[4] == symbol && position_board[6] == symbol
        end
end

# class Board
#     attr_accessor :board
    
#     def initialize
#         @board = Array.new(9, "")
#     end

#     def update(position, symbol)
#         @board[position.to_i] = symbol
#     end

#     def valid_position?(position)
#         if board[position.to_i] != ""
#             false
#         else
#             true
#         end
#     end

#     def valid_input?(position)
#         if position.to_i >= 1 && position.to_i <= 9 && position =~ (/\d/)
#             true
#         else
#             false
#         end
#     end

#     def full_board?
#         board.count("") == 0
#     end

#     def winner?(symbol)
#         board[0] == symbol && board[1] == symbol && board[2] == symbol ||
#         board[3] == symbol && board[4] == symbol && board[5] == symbol ||
#         board[6] == symbol && board[7] == symbol && board[8] == symbol ||
#         board[0] == symbol && board[3] == symbol && board[6] == symbol ||
#         board[1] == symbol && board[4] == symbol && board[7] == symbol ||
#         board[2] == symbol && board[5] == symbol && board[8] == symbol ||
#         board[0] == symbol && board[4] == symbol && board[8] == symbol ||
#         board[2] == symbol && board[4] == symbol && board[6] == symbol
#     end
# end