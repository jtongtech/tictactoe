require 'sinatra'
require 'rubygems'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'board.rb'

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
	redirect '/player_2_name'
end

get '/player_2_name' do
    erb :player_2_name
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name]
	redirect '/play_game'
end

get '/play_game' do
    erb :play_game, :locals => {:board => session[:board].board, :player_1_name => session[:player_1_name], :player_2_name => session[:player_2_name]}
    #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.  This is why mob helps i would have spent hours on that
end

post '/play_game' do
    session[:player_2_name] = params[:player_2_name]
	move = params[:square].to_i
    
end 


move = params[:square].to_i

	if session[:board].valid_space?(move)
		redirect '/make_move?move=' + move.to_s
	else
		redirect '/get_move'
	end
end

something like

get_player_move = game_loop(move)
coins = change(input_amount_to_be_reduced )
	stuff = hashconverter(coins)