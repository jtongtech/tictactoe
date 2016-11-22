require "minitest/autorun"

require_relative "sequential_ai.rb"

class TestSequentialAi < Minitest::Test
	
    def test_random_ai_player
        player = SequentialAi.new("x")
        assert_equal("x", player.marker)
    end

    def test_for_valid_space
        player = SequentialAi.new("x")
        assert_equal(true, player.valid_space?(["x", "x", "", "", "", "", "", ""], 2))
        assert_equal(false, player.valid_space?(["x", "x", "x", "x", "", "", "", ""], 2))
    end
    def test_make_a_move
        player = SequentialAi.new("x")
        assert_equal(3, player.get_move(["x", "x", "x", "", "", "", "", "", ""]))
        assert_equal(5, player.get_move(["x", "x", "x", "x", "x", "", "", "", ""]))
    end
end