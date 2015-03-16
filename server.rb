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
  @ppg = Calculate.points_per_game(params).all

  @ppg.each do |p|
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
