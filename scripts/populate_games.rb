require 'rubygems'
require 'sequel'
require 'nokogiri'
require 'open-uri'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
games = DB[:games]

games.delete
teams.each do |team|
  puts "adding games for #{team[:name]}"
  begin
    doc = Nokogiri::HTML(open("http://www.sports-reference.com/cbb/schools/#{team[:reference_id]}/2014-schedule.html"))
    doc.css('table#schedule tbody tr').each do |log|
      tds = log.search('td')
      next if tds[2].nil? || tds[2].inner_html != 'REG'
      next if tds[4].search('a')[0].nil? 
      opponent_id = teams.first(:reference_id => tds[4].search('a')[0][:href].split('/')[3])[:id]
      location = case tds[3].inner_html
                   when '' then 'Home'
                   when 'N' then 'Neutral'
                   when '@' then 'Away'
                   else raise "unknown game location #{tds[3].inner_html}"
                 end
      games.insert(:team_id => team[:id], :opponent_id => opponent_id, :score => tds[7].inner_html.to_i, :opponent_score => tds[8].inner_html.to_i, :location => location)
    end
  rescue Exception => e
    puts e.message
    puts e.backtrace
    sleep 1
    retry
  end
end

def location_adj game, is_win
  return 1.4 if game[:location] == 'Away' && is_win
  return 0.6 if game[:location] == 'Home' && is_win
  return 1.4 if game[:location] == 'Home' && !is_win
  return 0.6 if game[:location] == 'Away' && !is_win
  return 1
end

teams.each do |team|
  puts "calculating wins/losses for #{team[:name]}"
  wins = 0
  losses = 0
  team_games = games.where(:team_id => team[:id])
  next if team_games.count == 0
  team_games.each do |game|
    is_win = game[:score] > game[:opponent_score]
    adj = location_adj game, is_win
    is_win ? wins += adj : losses += adj
  end
  teams.where(:id => team[:id]).update(:wins => wins, :losses => losses)
end

teams.each do |team|
  puts "calculating rpi for #{team[:name]}"
  ow = 0
  ol = 0
  oow = 0
  ool = 0

  opponent_ids = teams.select(:games__opponent_id).join(:games, :team_id => :teams__id).where(:teams__id => team[:id]).collect{|o| o[:opponent_id]}
  teams.where(:id => opponent_ids).each do |opponent|
    ow += opponent[:wins]
    ol += opponent[:losses]
    opponent_opponent_ids = teams.select(:games__opponent_id).join(:games, :team_id => :teams__id).where(:teams__id => opponent[:id]).collect{|o| o[:opponent_id]}
    teams.where(:id => opponent_opponent_ids).each do |opponent_opponent|
      oow += opponent_opponent[:wins]
      ool += opponent_opponent[:losses]
    end
  end
  wp = team[:wins] / (team[:wins] + team[:losses]).to_f
  owp = ow / (ow + ol).to_f
  oowp = oow / (oow + ool).to_f

  teams.where(:id => team[:id]).update(:rpi => (wp * 0.25) + (owp * 0.50) + (oowp * 0.25))
end
