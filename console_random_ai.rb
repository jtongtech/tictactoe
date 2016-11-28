class RandomAI
    attr_accessor :marker

    def initialize(marker)
        @marker = marker
    end

    def valid_space?(board, choice)
        # board[choice] == ""
        board[choice] != "X" || board[choice] != "O"
    end

    def get_move(board)
        random_move = rand(1..9)
        if valid_space?(board, random_move) == false
            get_move(board)
        else
            random_move
        end
    end
 
end