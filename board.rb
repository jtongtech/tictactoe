class Board
    attr_accessor :board
    
    def initialize
        @board = Array.new(9, " ")
    end

    def update(position, symbol)
        @board[position.to_i] = symbol
    end

    def valid_position?(position)
        if board[position.to_i] != " "
            false
        else
            true
        end
    end

    def valid_input?(position)
        if position.to_i >= 1 && position.to_i <= 9 && position =~ (/\d/)
            true
        else
            false
        end
    end

    def full_board?
        board.count(" ") == 0
    end

    def winner?(symbol)
        board[0] == symbol && board[1] == symbol && board[2] == symbol ||
        board[3] == symbol && board[4] == symbol && board[5] == symbol ||
        board[6] == symbol && board[7] == symbol && board[8] == symbol ||
        board[0] == symbol && board[3] == symbol && board[6] == symbol ||
        board[1] == symbol && board[4] == symbol && board[7] == symbol ||
        board[2] == symbol && board[5] == symbol && board[8] == symbol ||
        board[0] == symbol && board[4] == symbol && board[8] == symbol ||
        board[2] == symbol && board[4] == symbol && board[6] == symbol
    end
end

# winning combos [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]