require "minitest/autorun"
require_relative "unbeatable_ai.rb"

class TestUnbeatableAi < Minitest::Test

    def test_create_player
        player = UnbeatableAi.new("x")
        assert_equal("x", player.marker)
    end

    def test_for_o_potential_block_position_0
        player = UnbeatableAi.new("o")
        assert_equal(0, player.get_move([" ", "x", "x", " ", " ", " ", " ", " ", " "]))
    end

     def test_for_o_potential_win_position_6
        player = UnbeatableAi.new("o")
        assert_equal(6, player.get_move(["x", "x", "o", " ", "o", " ", " ", " ", "x"]))
    end

    def test_for_o_potential_win_position_3
        player = UnbeatableAi.new("o")
        assert_equal(3, player.get_move(["x", " ", " ", " ", "o", "o", " ", " ", "x"]))
    end

    def test_for_x_potential_win_position_4
        player = UnbeatableAi.new("x")
        assert_equal(4, player.get_move(["x", "o", "x", " ", " ", " ", "o", " ", "x"]))
    end

    def test_for_o_block_position_8
        player = UnbeatableAi.new("o")
        assert_equal(8, player.get_move(["x", " ", "o", " ", "x", " ", "o", " ", " "]))
    end

    def test_for_x_block_position_5
        player = UnbeatableAi.new("x")
        assert_equal(5, player.get_move(["x", " ", " ", "o", "o", " ", " ", "x", " "]))
    end

    def test_for_x_position_4
        player = UnbeatableAi.new("o")
        assert_equal(4, player.get_move(["x", "o", "x", "o", " ", " ", "x", " ", " "]))
    end

    def test_for_if_center_available_take_center
        player = UnbeatableAi.new("o")
        assert_equal(4, player.get_move([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
    end

    def test_for_if_center_notavailable_take_corner
        player = UnbeatableAi.new("x")
        assert_equal(2, player.check_for_empty_corner(["x", " ", " ", " ", "x", " ", " ", " ", " "]))
    end

    # def test_for_fork_creation
    #     player = UnbeatableAi.new("x")
    #     assert_equal(8, player.check_for_winning_fork_option(["x", " ", " ", " ", "x", " ", " ", " ", " "]))
    # end

    # def test_for_fork_creation
    #     player = UnbeatableAi.new("x")
    #     assert_equal(6, player.check_for_winning_fork_option(["x", " ", " ", "o", "x", " ", " ", " ", "o"]))
    # end

    def test_for_o_rewriting_position
        player = UnbeatableAi.new("x")
        assert_equal(6, player.get_move(["o", " ", "x", "x", "x", "o", "o", " ", "x"]))
    end

    def test_X_opponent_corner_returns_2
        player = UnbeatableAi.new("X")
        assert_equal(2, player.opponent_corner([" "," "," "," "," "," ","O"," "," "]))
    end

    def test_X_opponent_corner_returns_6
        player = UnbeatableAi.new("X")
        assert_equal(6, player.opponent_corner([" "," ","O"," "," "," "," "," "," "]))
    end

    def test_X_opponent_corner_returns_0
        player = UnbeatableAi.new("X")
        assert_equal(0, player.opponent_corner([" "," "," "," "," "," "," "," ","O"]))
    end

    def test_for_empty_corner_returns_0
        player = UnbeatableAi.new("O")
        assert_equal(0, player.check_for_empty_corner([" ", " ", " ", " ", " ", " ", " ", " ", " "]))
    end

    def test_for_empty_corner_returns_2
        player = UnbeatableAi.new("O")
        assert_equal(2, player.check_for_empty_corner(["X", " ", " ", " ", "O", "X", " ", " ", " "]))
    end
end

    # def test_valid_move
    #     player = UnbeatableAi.new("x")
    #     move = player.get_move(Array.new(9, " "))
    #     assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))
    # end

    # def test_go_for_win_0
    #     player = UnbeatableAi.new("x")
    #     move = 0
    #     assert_equal(0, player.get_move([" ","x","x"," "," "," "," "," "," "]))
    # end

    # def test_go_for_win_4
    #     player = UnbeatableAi.new("x")
    #     move = 4
    #     assert_equal(4, player.get_move([" "," "," ","x"," ","x"," "," "," "]))
    # end
