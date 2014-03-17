require 'rubygems'
require 'sequel'
require 'nokogiri'
require 'open-uri'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
players = DB[:players]

players.delete
teams.each do |team|
  doc = Nokogiri::HTML(open("http://www.sports-reference.com/cbb/schools/#{team[:reference_id]}/2014.html"))
  doc.css('table#roster tbody tr').each do |player|
    player_id = player.search('td a')[0][:href].split('/').last.gsub('.html', '')
    name = player.search('td a')[0].inner_html
    players.insert(:name => name, :reference_id => player_id, :team_id => team[:id])
    puts "added #{name}"
  end
end
