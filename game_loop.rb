require_relative "console_game.rb"

game = ConsoleGame.new(Human.new("X"), (Human.new("O")))

game.print_board

def loop_game
    if ConsoleGame.counter % 2 == 0
        ConsoleGame.player_1.move
    else
        ConsoleGame.player_2.move
    end
    if board.full_board?
        puts "Tie Game"
    else
        loop_game
    end
end





move = game.get_move

game.make_move(move)

game.print_board.loop_game

#loop this and make it use the other methods