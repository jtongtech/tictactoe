class Human
    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

    def get_move(board)
        puts "Make your move!"
        move = gets.chomp.to_i
        move = move - 1
        if board[move] == " " && move >= 0
            move
        else
            puts "Try again!"
            get_move(board)
        end
    end
end