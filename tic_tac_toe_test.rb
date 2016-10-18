require "minitest/autorun"
require_relative tic_tac_toe.rb

class TicTacToe <Minitest::Test

    def position_one_x
        assert_equal(x,position[2])
    end

end