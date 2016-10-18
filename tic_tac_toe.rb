def print_board#(positions)
    positions = ["", "", "", "", "", "", "", "", "", ""]
    puts " #{positions[1]} | #{positions[2]} | #{positions[3]} "
    puts "-----------"
    puts " #{positions[4]} | #{positions[5]} | #{positions[6]} "
    puts "-----------"
    puts " #{positions[7]} | #{positions[8]} | #{positions[9]} "
end

puts print_board

puts "What is your input?"
answer = gets
puts "answer = #{answer}"

# def monkey(answer)
    position = answer[0]
    player = answer[1]
# end
puts "position = #{position}"
puts "player = #{player}"
# puts player

#     puts firstmove

# def update_board(updates)
#     input.map!["", "", "", "", "", "", "", "", "", ""]
# end