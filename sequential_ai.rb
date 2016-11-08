class SequentialAi
    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

    def get_move(board)
		board.index(" ")
	end
end