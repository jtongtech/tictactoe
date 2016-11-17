require 'sinatra'
require 'rubygems'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'board.rb'
require_relative 'console_human.rb'
enable :sessions

  ai = ""


get '/' do
    session[:board] = Board.new
    #session[:board] = Board.board
    erb :home
end

get '/rules' do
    erb :rules
end

get '/history' do
    erb :history
end


get '/player_1_name' do
    erb :player_1_name
end

post '/player_1_name' do
	session[:player_1_name] = params[:player_1_name]
	redirect '/opponent_type'
end

get '/opponent_type' do
  erb :opponent_type
end

post '/opponent' do
	player_2 = params[:player_2]

	if player_2 == "human"
		session[:player_2] = Human.new("O")

		erb :player_2_name, :locals => { :board => session[:board].board }

	elsif player_2 == "sequential_ai"
		session[:player_2] = SequentialAi.new("O")
		session[:player_2_name] = "CPU"

		redirect '/get_move'

	elsif player_2 == "random_ai"
		session[:player_2] = RandomAi.new("O")
		session[:player_2_name] = "CPU"

		redirect '/get_move'

	else player_2 == "unbeatable_ai"
		session[:player_2] = UnbeatableAi.new("O")
		session[:player_2_name] = "CPU"

		redirect '/get_move'
	end
end

# post '/opponent_type' do
# 	session[:player_2_name] = params[:player_2]

#     redirect '/get_move'
# end

get '/player_2_name' do
    erb :player_2_name
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name]
	redirect '/play_game'
end

get 'get_move' do
    erb :get_move
end

get '/play_game' do
    erb :play_game, :locals => {:board => session[:board].board, :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
    #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  This is why mob helps i would have spent hours on that
end