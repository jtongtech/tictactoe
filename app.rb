require 'sinatra'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'board.rb'

enable :session

ai = ""

session[:board] = Board.new()

get '/' do
    erb :home
end

get '/rules' do
    erb :rules
end

get '/history' do
    erb :history
end

get '/play_game' do
    erb :play_game, :locals => {:board => session[:board]}
    #the above saves your board and lets you pull it everytime you call it?  Pushes your board into the erb.
end