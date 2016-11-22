require 'sinatra'
require 'rubygems'
require_relative 'new_board.rb'
require_relative 'human.rb'
require_relative 'console_random_ai.rb'
require_relative 'console_sequential_ai.rb'
require_relative 'unbeatable_ai.rb'

enable :sessions

ai = ""

get '/' do
    session[:board] = Board.new(["","","","","","","","",""])
    erb :home, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
end

get '/player_1_name' do
    erb :player_1_name, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
end

post '/player_1_name' do
	session[:player_1_name] = params[:player_1]
	session[:player_1] = Console_human.new("X")
	session[:current_player] = session[:player_1]

    erb :opponent, :layout => :home_layout, :locals => { :board => session[:board].board_positions, :player_1_name => session[:player_1_name] }
    # redirect '/choose_opponent'
end

post '/choose_opponent' do
	player_2 = params[:player_2]

	if player_2 == "human"
		session[:player_2] = Console_human.new("O")
		
		erb :player_2_name, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
		session[:player_2_name] = params[:player_2]
        redirect 'player_2_name'

	elsif player_2 == "sequential_ai"
		session[:player_2] = SequentialAI.new("O")
		session[:player_2_name] = "Easy Opponent"

		redirect '/get_move'

	elsif player_2 == "random_ai"
		session[:player_2] = RandomAI.new("O")
		session[:player_2_name] = "Medium Opponent"

		redirect '/get_move'

	else player_2 == "unbeatable_ai"
		session[:player_2] = UnbeatableAI.new("O")
		session[:player_2_name] = "Hard Opponent"

		redirect '/get_move'
	end
end

get '/player_2_name' do
    erb :player_2_name, :layout => :home_layout, :locals => { :board => session[:board].board_positions }
end

post '/player_2_name' do
	session[:current_player_name] = session[:player_1_name]
    redirect '/get_move'
end

get '/get_move' do
	move = session[:current_player].get_move(session[:board].grid)
    
	if move == "NO"
	erb :get_move, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].board_positions }
          
    	elsif session[:board].valid_space?(move)
            redirect '/make_move' #+ move.to_s 
        else
        	redirect '/get_move'
	end
end

post '/get_player_move' do
    move = params[:square].to_i
	# puts "move is #{move}"

    if session[:board].valid_space?(move)
        redirect '/make_move?move=' + move.to_s
		
    else
        redirect '/get_move'
    end

end

get '/make_move' do
	
	move = params[:move].to_i
	puts "move is #{move}"
	session[:board].update((move - 1), session[:current_player].marker)

	erb :get_move, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].board_positions }

	if session[:board].winner?(session[:current_player].marker) == true
		player_1 = session[:player_1_name]
		player_2 = session[:player_2_name]
		winner = session[:current_player_name]
		
		erb :win, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].board_positions }

	elsif session[:board].full_board? == true
		player_1 = session[:player_1_name]
		player_2 = session[:player_2_name]
		winner = "Tie"
		erb :tie, :locals => { :board => session[:board].board_positions }
		
	else redirect '/change_player'
		
	end
end

get '/change_player' do
	
		if session[:current_player].marker == "X"
			session[:current_player] = session[:player_2]
			session[:current_player_name] = session[:player_2_name]
		else
			session[:current_player] = session[:player_1]
			session[:current_player].marker = "X"
			session[:current_player_name] = session[:player_1_name]
		end

		erb :get_move, :locals => { :current_player => session[:current_player], :current_player_name => session[:current_player_name], :board => session[:board].board_positions }
	
end
