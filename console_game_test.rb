require "minitest/autorun"
require_relative "game_loop.rb"
require_relative "board.rb"


class TestConsoleGame < Minitest::Test

    def test_create_human
        player = Human.new("X")
        assert_equal("X", player.marker)
    end
    def test_is_turn_being_taken
        player = Human.new("X")
        current_player = player_1
        current_player_1.symbol = "X"
        Board.winner?(current_player.symbol) == false
        Board.full_board? == false
        assert_equal(player_2, board_status(current_player))
    end
end