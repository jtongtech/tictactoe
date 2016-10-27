require_relative "console_game.rb"

game = ConsoleGame.new(Human.new("x"), Human.new("o"))

until game.game_over?
    game.print_board
    move = game.get_move
    game.make_move(move)
    game.print_board
    game.change_player
end

# require_relative "console_game.rb"

# game = Game.new(Human.new("x"), Human.new("o"))

# until game.game_over?
#     game.change_player
#     game.print_board
#     move = game.get_move
#     game.make_move(move)
#     game.print_board
# end

# game.end_message


# # Tie 142563789