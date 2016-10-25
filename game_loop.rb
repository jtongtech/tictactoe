require_relative "console_game.rb"

game = ConsoleGame.new(Human.new("X"), (Human.new("O")))

game.print_board