require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

    def test_new_board
        board = Board.new()
        assert_equal(["","","","","","","","",""], board.board)
    end
end
        