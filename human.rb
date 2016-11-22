class Console_human
    attr_accessor :marker

    def initialize(marker)
        @marker = marker
    end


    def get_move(board)
        "NO"
    end
    # def get_move(board)
    #     puts "Make a move (1-9):"
    #     move = gets.chomp.to_i
    #     move = move - 1
    #         if board[move] == "" && move >= 0
    #             move
    #         else
    #             puts "Wrong move, please select an empty space!"
    #             get_move(board)
    #         end
    # end
end