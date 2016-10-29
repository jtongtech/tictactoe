require_relative "console_game.rb"

game = ConsoleGame.new(Human.new("X"), Human.new("O"))

until game.game_over?
    game.print_board
    move = game.get_move
    game.make_move(move)
    game.print_board
    game.change_player
end

# require_relative "console_game.rb"

# who = [SequentialAi.new("o"), RandomAi.new("o")].sample

# game = Game.new(Human.new("x"), SequentialAi.new("o"))

# until game.game_over?
#     game.change_player
#     game.print_board
#     move = game.get_move
#     game.make_move(move)
#     game.print_board
# end

# game.end_message