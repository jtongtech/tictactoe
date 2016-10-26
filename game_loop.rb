require_relative "console_game.rb"

until game.game_over


game = ConsoleGame.new(Human.new("X"), (Human.new("O")))

game.print_board

move = game.get_move

game.make_move(move)

game.print_board

game.make_move(move)

game.print_board

#loop this and make it use the other methods