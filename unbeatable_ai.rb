#unbeatable ai
# Win: If the player has two in a row, they can place a third to get three in a row.
# Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
# Fork: Create an opportunity where the player has two threats to win (two non-blocked lines of 2).
# Blocking an opponent's fork:
# Option 1: The player should create two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has a corner, "O" has the center, and "X" has the opposite corner as well, "O" must not play a corner in order to win. (Playing a corner in this scenario creates a fork for "X" to win.)
# Option 2: If there is a configuration where the opponent can fork, the player should block that fork.
# Center: A player marks the center. (If it is the first move of the game, playing on a corner gives "O" more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
# Opposite corner: If the opponent is in the corner, the player plays the opposite corner.
# Empty corner: The player plays in a corner square.
# Empty side: The player plays in a middle square on any of the 4 sides.

class UnbeatableAi
    attr_reader :marker

    def initialize(marker)
        @marker = marker
    end

    def get_move(board)
        move = 1
         winning_combos = [
             [board[0], board[1], board[2]],
             [board[3], board[4], board[5]],
             [board[6], board[7], board[8]],
             [board[0], board[3], board[6]],
             [board[1], board[4], board[7]],
             [board[2], board[5], board[8]],
             [board[0], board[4], board[8]],
             [board[2], board[4], board[6]]
             ]
        winning_combos.each_with_index do |combo, index|
            if combo.count(marker) == 2 && combo.count("") == 1
                position = combo.index("")
                move = winning_combos[index][position]
            end
        end
        move
    end
end

# winning = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]