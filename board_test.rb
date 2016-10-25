require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

    def test_new_board #tests that board shows up
        board = Board.new()
        assert_equal(["","","","","","","","",""], board.board)
    end
end
        