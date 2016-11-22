class UnbeatableAi
    attr_accessor :marker, :open_spot

    def initialize(marker)
        @marker = marker
        @open_spot = 10    
    end    

    def get_move(board)
        @open_spot = 10
        comp_marker = marker

        if comp_marker == "o"
            player_marker = "x"
        else
            player_marker = "o"
        end

        if potential_win_block(board, comp_marker) <= 8
            move = open_spot
        elsif potential_win_block(board, player_marker) <= 8
            move = open_spot
        elsif check_for_center(board)
            move = open_spot
        else check_for_empty_corner(board)
            move = open_spot
        end
        move
    end

    def win_combinations(board)
        [
            [board[0],board[1],board[2]],
            [board[3],board[4],board[5]],
            [board[6],board[7],board[8]],
            [board[0],board[3],board[6]],
            [board[1],board[4],board[7]],
            [board[2],board[5],board[8]],
            [board[0],board[4],board[8]],
            [board[2],board[4],board[6]]
        ]
    end

    def win_positions
        win_positions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    end

    def potential_win_block(board, current_marker)

        win_combinations(board).each_with_index do |winner, index|
            if winner.count(current_marker) == 2 && winner.count("") == 1
                space_in_winning_line = winner.index("")
                @open_spot = win_positions[index][space_in_winning_line]
            end
        end
        open_spot
    end
    def check_for_center(board)
        if board[4] == ""
            @open_spot = 4
        end
    end
    def check_for_empty_corner(board)
        corners = [0, 2, 6, 8]
        corners.each do |corner|
            if board[corner] == ""
                @open_spot = corner
                break
            end
        end
    open_spot
    end
end