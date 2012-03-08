require 'rubygems'
require 'sequel'
require 'nokogiri'
require 'open-uri'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
players = DB[:players]
boxscores = DB[:boxscores]

players.each do |player|
  next if boxscores.filter(:player_id => player[:id]).count > 0
  puts "adding box scores for #{player[:name]}"
  begin
    doc = Nokogiri::HTML(open("http://www.sports-reference.com/cbb/players/#{player[:reference_id]}/gamelog/2012/"))
    doc.css('table#gamelog tbody tr').each do |log|
      next if log.search('td a')[2].nil? 
      log_id = log.search('td a')[0][:href].split('/').last.gsub('.html', '')
      ref = log.search('td a')[2][:href].split('/')[3]
      opponent_id = teams.first(:reference_id => log.search('td a')[2][:href].split('/')[3])[:id]
      result = log.search('td a')[3].inner_html
      points = log.search('td')[26].inner_html.to_i
      boxscores.insert(:player_id => player[:id], :game_id => log_id, :opponent_id => opponent_id, :result => result, :points => points)
    end
  rescue Exception => e
    puts e.message
    sleep 1
    retry
  end
end
