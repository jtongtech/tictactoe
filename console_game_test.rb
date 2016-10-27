require "minitest/autorun"
require_relative "game_loop.rb"
require_relative "board.rb"


class TestGameLoop < Minitest::Test

    def test_create_human
        player = Human.new("X")
        assert_equal("X", player.marker)
    end
    def test_is_turn_being_taken
        current_player = Human.new("X")
        valid_space? == true
        valid_input? == true
        assert_equal(true, turn(current_player))
    end
end