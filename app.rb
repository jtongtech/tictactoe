require 'sinatra'
require_relative 'random_ai.rb'
require_relative 'unbeatable_ai.rb'
require_relative 'sequential_ai.rb'
require_relative 'board.rb'

enable :sessions

ai = ""

play_board = Board.new()

get '/' do
    erb :home
end

get '/rules' do
    erb :rules
end

get '/history' do
    erb :history
end