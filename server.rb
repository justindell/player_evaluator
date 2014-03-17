require 'sinatra'
require 'thin'
require 'json'
require './calculate'

class NilClass
  def empty?
    true
  end
end

set(:css_dir) { File.join(views, 'css') }

get '/' do
  @games_per_seed = {}
  @ppg = Calculate.points_per_game(params).all
  wins = Calculate.expected_wins

  (1..16).each {|seed| @games_per_seed[seed] = wins.select{|w| w[:seed] == seed}.first[:average_wins] + 1}
  @ppg.each do |p|
    p[:expected_points] = @games_per_seed[p[:seed]] * p[:points]
    p[:silver_points] = p[:points] * (p[:silver_games] || 0)
  end
  @ppg.sort!{|a,b| b[:silver_points] <=> a[:silver_points]}

  erb :index
end

get '/teams' do
  Calculate.teams.to_json
end

post '/draft' do
  Calculate.draft params[:player_id] 
  redirect to('/')
end
