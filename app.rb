#make a board print to the screen
def tic(*input)
    positions = ["", "X", "", "", "", "", "", "", "", ""]
    puts " #{positions[1]} | #{positions[2]} | #{positions[3]} "
    puts "-----------"
    puts " #{positions[4]} | #{positions[5]} | #{positions[6]} "
    puts "-----------"
    puts " #{positions[7]} | #{positions[8]} | #{positions[9]} "
end

puts tic

#array of strings where each string is an input
#hash where key is place on board and value is x or o or " "