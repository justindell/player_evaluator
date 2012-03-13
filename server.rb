require 'sinatra'
require 'json'
require './calculate'

class NilClass
  def empty?
    true
  end
end

set(:css_dir) { File.join(views, 'css') }

get '/' do
  @ppg = Calculate.points_per_game params
  @wins_per_seed = {}
  @wins_per_seed[nil] = 0
  (1..16).each {|seed| @wins_per_seed[seed] = Calculate.expected_wins(seed)}
  erb :index
end

get '/teams' do
  Calculate.teams.to_json
end

post '/draft' do
  Calculate.draft params[:player_id] 
  redirect to('/')
end
