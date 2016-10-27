require_relative "console_game.rb"



game = ConsoleGame.new(Human.new("X"), (Human.new("O")))

game.print_board

move = game.get_move

game.make_move(move)


#loop this and make it use the other methods