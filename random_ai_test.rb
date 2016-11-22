require "minitest/autorun"

require_relative "random_ai.rb"

class TestRandomAi < Minitest::Test
    def test_random_ai_player
        player = RandomAi.new("x")
        assert_equal("x", player.marker)
    end

    def test_for_valid_space
        player = RandomAi.new("x")
        assert_equal(true, player.valid_space?(["", "x", "x", "x", "x", "x", "x", "x"], 0))
        assert_equal(false, player.valid_space?(["", "x", "x", "x", "x", "x", "x", "x"], 4))
    end

    def test_make_a_move
        player = RandomAi.new("x")
        assert_equal(8, player.get_move(["x", "x", "x", "x", "x", "x", "x", "x", ""]))
        assert_equal(7, player.get_move(["x", "x", "x", "x", "x", "x", "x", "", "x"]))
    end
end