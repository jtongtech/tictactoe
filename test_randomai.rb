require "minitest/autorun"
require_relative 'console_random_ai.rb'


class TestRandomAI < Minitest::Test

    def test_random_ai_player
        player = RandomAI.new("O")
        assert_equal("O", player.marker)
    end

    def test_for_valid_space
        player = RandomAI.new("O")
        assert_equal(true, player.valid_space?(["","O","X","O","O","O","O","O", "O"], 0))
        end
    
    def test_for_invalid_space
        player = RandomAI.new("O")
        assert_equal(false, player.valid_space?(["O","","X","O","O","O","O","O", "O"], 0))
    end

    def test_get_move
        player = RandomAI.new("O")
        assert_equal(1, player.get_move(["O","","X","O","O","O","O","O", "O"]))
    end
end