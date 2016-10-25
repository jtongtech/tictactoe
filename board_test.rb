require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

    def test_new_board #tests that board shows up
        board = Board.new()
        assert_equal(["","","","","","","","",""], board.position_board)
    end

    def test_update_board_first_turn
       board = Board.new
       board.update(1, "X")
       assert_equal(["","X","","","","","","",""], board.position_board)
    end
    
    def test_update_board_second_turn
       board = Board.new
       board.position_board = ["","X","","","","","","",""]
       board.update("0", "O")
       assert_equal(["O","X","","","","","","",""], board.position_board)
    end
    
    def test_update_board_occupied_space
       board = Board.new
       board.position_board = ["X","O","","","","","","",""]
       assert_equal(false, board.valid_space?("0"))
    end
    
    def test_update_board_unoccupied_space
       board = Board.new
       board.position_board = ["X","O","","","","","","",""]
       assert_equal(true, board.valid_space?("2"))
    end

    def test_update_board_valid_input
       board = Board.new
       assert_equal(false, board.valid_input?("10"))
    end 

    def test_update_board_invalid_input
       board = Board.new
       assert_equal(false, board.valid_input?("a"))
    end
    
    def test_update_board_valid_input_5
       board = Board.new
       assert_equal(true, board.valid_input?("5"))
    end

    def test_full_board
        board = Board.new
        board.position_board = ["X","O","X","O","X","O","X","O","X"]
        assert_equal(true, board.full_board?)
    end
   
    def test_full_board_not_full
        board = Board.new
        board.position_board = ["","","X","O","X","O","X","O","X"]
        assert_equal(false, board.full_board?)
    end

    def test_for_winner_for_X
        board = Board.new()
        board.position_board = ["X","X","X","","","","","",""]
        symbol = "X"
        assert_equal(true, board.winner?(symbol))
    end
    def test_for_winner_for_O
        board = Board.new()
        board.position_board = ["O","O","O","","","","","",""]
        symbol = "O"
        assert_equal(true, board.winner?(symbol))
    end
    def test_for_diagonal_winner
        board = Board.new()
        board.position_board = ["O","","","","O","","","","O"]
        symbol = "O"
        assert_equal(true, board.winner?(symbol))
    end
    def test_for_vertical_winner
        board = Board.new()
        board.position_board = ["O","","","O","","","O","",""]
        symbol = "O"
        assert_equal(true, board.winner?(symbol))
    end
    def test_for_false_win
        board = Board.new()
        board.position_board = ["O","","O","","","","","",""]
        symbol = "O"
        assert_equal(false, board.winner?(symbol))
    end
end
    