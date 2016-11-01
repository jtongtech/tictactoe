require "minitest/autorun"
require_relative "unbeatable_ai.rb"


class TestUnbeatableAi < Minitest::Test
	
    def test_unbeatable_ai_player
        player = UnbeatableAi.new("x")
        assert_equal("x", player.marker)
    end

    def test_for_get_move
        player = UnbeatableAi.new("X")
        assert_equal(true, [0,1,2,3,4,5,6,7,8].include?(player.get_move(["", "", "", "", "", "", "", "", ""])))
    end

    def test_for_available_winning_space_at_0
        player = UnbeatableAi.new("X")
        assert_equal(0, player.get_move(["", "X", "X", "", "", "", "", "", ""]))
    end


    # def test_make_a_move
    #     player = SequentialAi.new("x")
    #     assert_equal(3, player.get_move(["x", "x", "x", "", "", "", "", "", ""]))
    #     assert_equal(5, player.get_move(["x", "x", "x", "x", "x", "", "", "", ""]))
    # end

end
