require "minitest/autorun"
require_relative "console_human.rb"


class TestConsoleHuman < Minitest::Test

    def test_create_human
        player = Human.new("X")
        assert_equal("X", player.marker)
    end



end