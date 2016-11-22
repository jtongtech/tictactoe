require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

    def test_new_board
        board = Board.new()
        assert_equal(["","","","","","","","",""], board.board)
    end

    def test_for_update_board
        board = Board.new()
       board.update("0", "x")
       assert_equal(["x","","","","","","","",""], board.board)
    end

    def test_for_update_board_turn_2
        board = Board.new()
        board.board = ["x","","","","","","","",""]
        board.update("1","o")
        assert_equal(["x","o","","","","","","",""], board.board)
    end

    def test_for_occupied_space
        board = Board.new()
        board.board = ["x","o","","","","","","",""]
        assert_equal(false, board.valid_space?("1"))
        assert_equal(true, board.valid_space?("2"))
    end

    def test_for_valid_input
        board = Board.new()
        assert_equal(false, board.valid_input?("11"))
        assert_equal(false, board.valid_input?("-1"))
        assert_equal(true, board.valid_input?("5"))
        assert_equal(false, board.valid_input?("n"))
    end

    def test_for_full_board
        board = Board.new()
        board.board = ["x","o","x","o","x","o","x","o","x"]
        assert_equal(true, board.full_board)
    end

    def test_partial_board_returns_false
        board = Board.new()
        board.board = ["x","o","","","","","","",""]
        assert_equal(false, board.full_board)
    end

    def test_for_x_winner
        board = Board.new()
        board.board = ["x","x","x","","","","","",""]
        symbol = "x"
        assert_equal(true, board.winner?(symbol))
    end

    
    def test_for_o_winner
        board = Board.new()
        board.board = ["o","o","o","","","","","",""]
        symbol = "o"
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_diagonal_winner_o
        board = Board.new()
        board.board = ["o","","","","o","","","","o"]
        symbol = "o"
        assert_equal(true, board.winner?(symbol))
    end

    def test_x_winner_left_row
        board = Board.new()
        board.board = ["x","","","x","","","x","",""]
        symbol = "x"
        assert_equal(true, board.winner?(symbol))
    end

    def test_for_false_win
        board = Board.new()
        board.board = ["x","","","","","","x","",""]
        symbol = "x"
        assert_equal(false, board.winner?(symbol))
    end
end

