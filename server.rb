require 'sinatra'
require 'json'
require './calculate'

set(:css_dir) { File.join(views, 'css') }

get '/' do
  @ppg = Calculate.points_per_game params
  erb :index
end

get '/teams' do
  Calculate.teams.to_json
end

post '/draft' do
  Calculate.draft params[:player_id] 
  redirect to('/')
end
