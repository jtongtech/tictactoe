require "minitest/autorun"
require_relative 'console_sequential_ai.rb'


class TestRandomAI < Minitest::Test

    def test_sequential_ai_player
        player = SequentialAI.new("O")
        assert_equal("O", player.marker)
    end

    def test_for_valid_space
        player = SequentialAI.new("O")
        assert_equal(true, player.valid_space?(["X","","","O","O","O","O","O", "O"], 1))
        end
    
    def test_for_invalid_space
        player = SequentialAI.new("O")
        assert_equal(false, player.valid_space?(["O","","X","O","O","O","O","O", "O"], 0))
    end

    # def test_get_move
    #     player = SequentialAI.new("O")
    #     assert_equal(0, player.get_move(["O","","X","O","O","O","O","O", "O"]))
    # end
end