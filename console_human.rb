class Human
    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

    def get_move(board)
        puts "Make your move punk..."
        move = gets.chomp.to_i
            if board[move] == ""
                move
            else
                puts "That square is already in play friend."
                get_move(board)
            end
    end

end