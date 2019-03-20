require 'rubygems'
require 'sequel'
require 'nokogiri'
require 'open-uri'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
teams.update(:rpi_rank => nil)

doc = Nokogiri::HTML(open("https://www.teamrankings.com/ncb/rpi/"))
doc.search('table.datatable tbody tr').each do |row|
  rank = row.search('td')[0].inner_html
  team = row.search('td')[1].search('a').inner_html.gsub('.', '').gsub("'", "")
  puts "#{rank}. finding RPI for #{team}"
  records = teams.where(Sequel.like(:name, "#{team}%")).or(Sequel.like(:alternate_name, "#{team}%")).all
  team_id = 0
  if records.count > 1
    reference = teams.filter(:reference_id => team.downcase)
    if reference.count == 1
      team_id = reference.first[:id]
    else
      puts %Q|choose a team matching #{team} from:\n#{records.collect{|r| "#{r[:id]}. #{r[:name]}"}.join("\n")}|
      team_id = gets.to_i
    end
  elsif records.count == 1
    team_id = records.first[:id]
  else
    puts "no teams found for #{team}. Please input correct id."
    team_id = gets.to_i
  end
  teams.filter(:id => team_id).update(:rpi_rank => rank)
end
