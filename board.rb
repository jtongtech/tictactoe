class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(9, "")
    end

    def update(position, marker)
        @grid[position.to_i] = marker
    end
    
    def valid_space?(position)
        if @grid[position] == "X" || @grid[position] == "O"
            false
        else
            true
        end
    end

    def valid_input?(position)
        if position.to_i >= 1 && position.to_i <= 9 && position =~ (/^(\d)+$/) 
            true          
        else
            false
        end
    end

    def full_board?
        grid.count("") == 0        
    end


    def winner?(marker)
        grid[0] == marker && grid[1] == marker && grid[2] == marker ||
        grid[3] == marker && grid[4] == marker && grid[5] == marker ||
        grid[6] == marker && grid[7] == marker && grid[8] == marker ||
        grid[0] == marker && grid[3] == marker && grid[6] == marker ||
        grid[1] == marker && grid[4] == marker && grid[7] == marker ||
        grid[2] == marker && grid[5] == marker && grid[8] == marker ||
        grid[0] == marker && grid[4] == marker && grid[8] == marker ||
        grid[2] == marker && grid[4] == marker && grid[6] == marker
    end
end