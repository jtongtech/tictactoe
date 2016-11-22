require "minitest/autorun"
require_relative 'console_game.rb'


class TestConsoleGame < Minitest::Test

    def test_player_change_X_to_O
        game = Console_game.new("X", "O")
        game.current_player == "X"
		assert_equal("O", game.current_player)
	end	

    def test_player_change_O_to_X
        game = Console_game.new("O", "X")
        game.current_player == "O"
		assert_equal("X", game.current_player)
	end	

    # def test_get_current_player_X_move
    #     game = Console_game.new("X", "O")
    #     game.current_player == "X"
    #     move = game.get_move(game.board.grid)
    #     assert_equal(true, [0, 1, 2, 3, 4, 5, 6, 7, 8].include?(move))
    # end

    # def test_make_current_player_X_move
    #      game = Console_game.new("X", "O")
    #      board = Board.new()
    #      move = game.make_move
    #      game.current_player.marker == "X"
    #      assert_equal("X", make_move(move))
    # end

    def test_game_over_not_yet_winner
        game = Console_game.new("X", "O")
        # game.current_player == "X"
        assert_equal(false, game.board.winner?("X"))
    end
    
    def test_game_over_yes_winner
        game = Console_game.new("X", "O")
        game.board.grid[0] = "X"
        game.board.grid[1] = "X"
        game.board.grid[2] = "X"
        assert_equal(true, game.board.winner?("X"))
    end

    def test_full_board
        game = Console_game.new("X", "O")
        game.board.grid[0] = "X"
        game.board.grid[1] = "O"
        game.board.grid[2] = "O"
        game.board.grid[3] = "O"
        game.board.grid[4] = "X"
        game.board.grid[5] = "X"
        game.board.grid[6] = "X"
        game.board.grid[7] = "O"
        game.board.grid[8] = "O"
        assert_equal(0, game.board.grid.count(""))
    end

    def test_board_not_full
        game = Console_game.new("X", "O")
        game.board.grid[0] = ""
        game.board.grid[1] = "O"
        game.board.grid[2] = "O"
        game.board.grid[3] = "O"
        game.board.grid[4] = "X"
        game.board.grid[5] = "X"
        game.board.grid[6] = "X"
        game.board.grid[7] = "O"
        game.board.grid[8] = "O"
        assert_equal(1, game.board.grid.count(""))
    end

    def test_game_over_tie
        game = Console_game.new("X", "O")
        game.board.grid[0] = "X"
        game.board.grid[1] = "O"
        game.board.grid[2] = "O"
        game.board.grid[3] = "O"
        game.board.grid[4] = "X"
        game.board.grid[5] = "X"
        game.board.grid[6] = "X"
        game.board.grid[7] = "O"
        game.board.grid[8] = "O"
        assert_equal(true, game.board.full_board?)
    end

    # def test_who_plays_human_player
    #     game = Console_game.new("X", "O")
    #     player_choice = 1
    #     assert_equal(Console_human, player)
    # end
end