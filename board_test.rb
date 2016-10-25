require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test

    def test_new_board #tests that board shows up
        board = Board.new()
        assert_equal(["","","","","","","","",""], board.board)
    end

    def test_grid
       board_sliced = @board.each_slice(3) {|row| puts row.join(' | ')}
       assert_equal(@board.each_slice(3) {|row| puts row.join(' | ')}, board.board)
    end         
end
        