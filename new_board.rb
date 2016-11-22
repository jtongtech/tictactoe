class Board

	attr_accessor :grid
	
	def initialize(board)
		@grid = board
	end

	def board_positions()
		new_board = []
		grid.each_with_index do |value, index|
			if value == "X" || value == "O"
				new_board.push(value)
			else
				new_board.push(index + 1)
			end
		end
		new_board
	end

	def update(position, marker)
		grid[position] = marker
	end

	def valid_space?(position)
		position = (position - 1)
		position >= 0 && position <= 8 && grid[position] == ""
	end

	def full_board?
		grid.count("") == 0
	end

	def winner?(marker)
		result = false
		winning_combo = [[grid[0],grid[1],grid[2]],
                         [grid[3],grid[4],grid[5]],
                         [grid[6],grid[7],grid[8]],
                         [grid[0],grid[3],grid[6]],
                         [grid[1],grid[4],grid[7]],
                         [grid[2],grid[5],grid[8]],
                         [grid[0],grid[4],grid[8]],
                         [grid[2],grid[4],grid[6]]]

        winning_combo.each do |winner|
        	if winner.count(marker) == 3
        		result = true
        	end
        end
        result
	end

end