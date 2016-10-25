require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

    def test_new_board #tests that board shows up
        board = Board.new()
        assert_equal(["","","","","","","","",""], board.position_board)
    end

    def test_update_board
       board = Board.new
       board.update(1, "X")
       assert_equal(["","X","","","","","","",""], board.position_board)
    end
    def test_update_board_o
       board = Board.new
       board.position_board = ["","X","","","","","","",""]
       board.update(0, "O")
       assert_equal(["O","X","","","","","","",""], board.position_board)
    end       
end
        