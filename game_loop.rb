require_relative "console_game.rb"

game = ConsoleGame.new(Human.new("x"), Human.new("o"))

until game.game_over?
    game.print_board
    move = game.get_move
    game.make_move(move)
    game.print_board
    game.change_player
end

#loop this and make it use the other methods