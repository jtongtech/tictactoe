require "minitest/autorun"
require_relative "game_loop.rb"
require_relative "board.rb"


class TestConsoleGame < Minitest::Test

    def test_create_human
        player = Human.new("X")
        assert_equal("X", player.marker)
    end
    def test_for_human_p1_and_p2
        p1 = Human.new("X")
        p2 = Human.new("O")
        game = ConsoleGame.new(p1, p2)
        assert_equal("X", game.p1.marker)
        assert_equal("O", game.p2.marker)
    end
    def test_for_current_player
        p1 = Human.new("X")
        p2 = Human.new("O")
        game = ConsoleGame.new(p1, p2)
        assert_equal(p1, game.current_player)
        assert_equal("X", game.current_player.marker)
    end
    def test_for_changing_current_player
        p1 = Human.new("X")
        p2 = Human.new("O")
        game = ConsoleGame.new(p1, p2)
        game.change_player
        assert_equal(p2, game.current_player)
    end
end