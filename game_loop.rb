require_relative 'console_game.rb'

game = Console_game.new()

until game.game_over?
    game.change_player
    game.draw_board
    move = game.get_move
    game.make_move(move)
    game.draw_board

end

game.end_message