   class Board
        attr_reader :board, :empty_square

        def initialize
            @empty_square = "-" #if the square has not been played it is empty
            #@board = Array.new(9, @empty_square) #makes an array of 9 " "'s
            @board = Array.new(9, "")
        end
    end