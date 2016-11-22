require "minitest/autorun"
require_relative 'board.rb'


class TestTicTacToeBoard < Minitest::Test

    def test_for_valid_input
        board = Board.new()
        assert_equal(false, board.valid_input?("11"))
        assert_equal(true, board.valid_input?("5"))
    end

    def test_for_occupied_space
        board = Board.new()
        board.grid = ["X","O","","","","","","",""]
        assert_equal(false, board.valid_space?(1))
        assert_equal(true, board.valid_space?(2))
    end

    def test_for_update_board_turn_2
        board = Board.new()
        board.grid = ["X","","","","","","","",""]
        board.update(1, "O")
        assert_equal(["X","O","","","","","","",""], board.grid)
    end

    def test_for_update_board_turn_1
        board = Board.new()
        board.grid = ["","","","","","","","",""]
        board.update(0, "X")
        assert_equal(["X","","","","","","","",""], board.grid)
    end

    def test_empty_board
        board = Board.new()
		assert_equal(Array.new(9, ""), board.grid)
	end	

    def test_integer_only
        board = Board.new()
        assert_equal(false, board.valid_input?("X"))
    end

    def test_for_full_board
        board = Board.new()
        board.grid = ["X","O","O","X","O","X","O","X","O"]
        assert_equal(true, board.full_board?)
    end

    def test_partial_board_returns_false
        board = Board.new()
        board.grid = ["X","O","","","","","","",""]
        assert_equal(false, board.full_board?)
    end

    def test_for_winner_X
        board = Board.new()
        symbol = "X"
        board.grid = ["X","X","X","","","","","",""]
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_winner_O
        board = Board.new()
        symbol = "O"
        board.grid = ["O","O","O","","","","","",""]
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_winner_X_diagonal
        board = Board.new()
        symbol = "X"
        board.grid = ["X","","","","X","","","","X"]
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_winner_O_diagonal
        board = Board.new()
        symbol = "O"
        board.grid = ["","","O","","O","","O","",""]
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_false_win
        board = Board.new()
        symbol = "O"
        board.grid = ["","O","","","O","","O","",""]
        assert_equal(false, board.winner?(symbol))
    end 
end
