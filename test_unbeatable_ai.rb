require "minitest/autorun"
require_relative 'unbeatable_ai.rb'


class TestUnbeatableAI < Minitest::Test

    def test_create_player
        player = UnbeatableAI.new("X")
        assert_equal("X", player.marker)
    end

    def test_for_X_potential_win_position_0
        player = UnbeatableAI.new("X")
        assert_equal(0, player.get_move(["", "X", "X", "", "", "", "", "", ""]))
    end

     def test_for_O_potential_win_position_6
        player = UnbeatableAI.new("O")
        assert_equal(6, player.get_move(["X", "X", "O", "", "O", "", "", "", "X"]))
    end

    def test_for_O_potential_win_position_3
        player = UnbeatableAI.new("O")
        assert_equal(3, player.get_move(["X", "", "", "", "O", "O", "", "", "X"]))
    end

    def test_for_X_potential_win_position_4
        player = UnbeatableAI.new("X")
        assert_equal(4, player.get_move(["X", "O", "X", "", "", "", "O", "", "X"]))
    end

    def test_for_O_block_position_8
        player = UnbeatableAI.new("O")
        assert_equal(8, player.get_move(["X", "", "O", "", "X", "", "O", "", ""]))
    end

    def test_for_X_block_position_5
        player = UnbeatableAI.new("X")
        assert_equal(5, player.get_move(["X", "", "", "O", "O", "", "", "X", ""]))
    end

    def test_O_create_fork_returns_zero
		player = UnbeatableAI.new("O")
		assert_equal(0, player.get_move(["", "O", "", "", "O", "X", "", "X", ""]))
	end

    def test_X_create_fork_returns_6
        player = UnbeatableAI.new("X")
        assert_equal(6, player.get_move(["", "O", "", "", "X", "O", "", "X", ""]))
    end

    def test_O_takes_center_returns_4
		player = UnbeatableAI.new("O")
		assert_equal(4, player.get_move(["X", "", "", "", "", "", "", "", ""]))	
	end	

    def test_X_takes_center_returns_4
		player = UnbeatableAI.new("O")
		assert_equal(4, player.get_move(["", "O", "", "", "", "", "", "", ""]))	
	end	

    def test_O_center_not_available_take_corner
		player = UnbeatableAI.new("O")
		assert_equal(0, player.get_move(["", "", "", "", "X", "", "", "", ""]))	
	end	

    def test_0_opponent_corner_returns_8
		player = UnbeatableAI.new("O")
		assert_equal(8, player.opponent_corner(["X", "", "", "", "", "", "", "", ""]))
	end

    def test_X_opponent_corner_returns_2
        player = UnbeatableAI.new("X")
        assert_equal(2, player.opponent_corner(["","","","","","","O","",""]))
    end

    def test_X_opponent_corner_returns_6
        player = UnbeatableAI.new("X")
        assert_equal(6, player.opponent_corner(["","","O","","","","","",""]))
    end

    def test_X_opponent_corner_returns_0
        player = UnbeatableAI.new("X")
        assert_equal(0, player.opponent_corner(["","","","","","","","","O"]))
    end

    def test_for_empty_corner_returns_0
        player = UnbeatableAI.new("O")
        assert_equal(0, player.get_move(["", "", "", "", "X", "", "", "", ""]))
    end

    def test_for_empty_corner_returns_2
        player = UnbeatableAI.new("O")
        assert_equal(2, player.get_move(["X", "", "", "", "O", "X", "", "", ""]))
    end

    def test_for_empty_side_returns_1
        player = UnbeatableAI.new("O")
        assert_equal(1, player.check_empty_side(["X", "", "O", "", "O", "X", "", "", ""]))
    end

    def test_for_empty_side_returns_3
        player = UnbeatableAI.new("O")
        assert_equal(3, player.check_empty_side(["X", "O", "O", "", "O", "X", "X", "", ""]))
    end
    

end