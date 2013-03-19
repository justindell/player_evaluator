require 'rubygems'
require 'sequel'
require 'nokogiri'
require 'open-uri'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
players = DB[:players]
boxscores = DB[:boxscores]

boxscores.delete
players.each do |player|
  next if boxscores.filter(:player_id => player[:id]).count > 0
  next if teams.filter(:id => player[:team_id]).first[:rpi].nil?
  puts "adding box scores for #{player[:name]}"
  begin
    doc = Nokogiri::HTML(open("http://www.sports-reference.com/cbb/players/#{player[:reference_id]}/gamelog/2013/"))
    doc.css('table#gamelog tbody tr').each do |log|
      next if log.search('td a')[2].nil? 
      opponent_id = teams.first(:reference_id => log.search('td a')[2][:href].split('/')[3])[:id]
      tds = log.search('td')
      result = tds[6].inner_html
      points = tds[26].inner_html.to_i
      boxscores.insert(:player_id => player[:id], :opponent_id => opponent_id, :result => result, :points => points)
    end
  rescue Exception => e
    puts "Exception occurred"
    puts e.message
    sleep 1
    retry
  end
end
