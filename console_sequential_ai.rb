class SequentialAI
    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

    def valid_space?(board, choice)
       board[choice] != "X" || board[choice] != "O"
    end

    def get_move(board)
        n = board.index("")
        choice = n + 1

        if valid_space?(board, choice) == false
            get_move(board)
        else
            choice
        end
        # board.index("")
    end
 
    end