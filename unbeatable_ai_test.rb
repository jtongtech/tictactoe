require "minitest/autorun"

require_relative "unbeatable_ai.rb"

class TestUnbeatableAi < Minitest::Test

    # def test_random_ai_player
    #     player = UnbeatableAi.new("x")
    #     assert_equal("x", player.marker)
    # end

    # def test_for_valid_move
    #     player = UnbeatableAi.new("x")
    #     assert_equal(true, [0,1,2,3,4,5,6,7,8].include?(player.get_move(["","","","","","","","",""])))
    # end

    # def test_for_win_at_five
    #     player = UnbeatableAi.new("x")
    #     assert_equal(5, player.get_move(["","","","x","x","","","",""]))
    # end

    # def test_for_error_on_x_fourth_turn
    #     player = UnbeatableAi.new("o")
    #     assert_equal(5, player.get_move(["o","x","o","","x","","x","o","x"]))
    # end   
    # def test_for_x_block_position_5
    #     player = UnbeatableAi.new("x")
    #     assert_equal(5, player.get_move(["x", "", "", "o", "o", "", "", "x", ""]))
    # end

    # def test_for_x_position_4
    #     player = UnbeatableAi.new("o")
    #     assert_equal(4, player.get_move(["x", "o", "x", "o", "", "", "x", "", ""]))
    # end

    # def test_for_if_center_available_take_center
    #     player = UnbeatableAi.new("o")
    #     assert_equal(4, player.get_move(["", "", "", "", "", "", "", "", ""]))
    # end

    # def test_for_if_center_notavailable_take_corner
    #     player = UnbeatableAi.new("x")
    #     assert_equal(2, player.check_for_empty_corner(["x", "", "", "", "x", "", "", "", ""]))
    # end
    def test_for_opponent_corner
        player = UnbeatableAi.new("x")
        assert_equal(2, player.opponent_corner(["o", "", "", "", "o", "", "", "", ""]))
    end
end