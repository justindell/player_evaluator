require 'rubygems'
require 'sequel'
require 'csv'

DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
csv_file = File.expand_path(File.dirname(__FILE__)) + '/data/silver2014.csv'

teams.update(:expected_games => nil)
CSV.foreach(csv_file, :headers => true) do |row|
  name = row["TEAM"]
  records = teams.filter("name like '#{name}%'").all
  if records.count > 1
    reference = teams.filter(:reference_id => name.downcase)
    if reference.count == 1
      team_id = reference.first[:id]
    else
      puts %Q|choose a team matching #{name} from:\n#{records.collect{|r| "#{r[:id]}. #{r[:name]}"}.join("\n")}|
      team_id = gets.to_i
    end
  elsif records.count == 1
    team_id = records.first[:id]
  else
    puts "no teams found for #{name}. Please input correct id."
    team_id = gets.to_i
  end
  games = row["ROUND OF 32"].to_f + row["ROUND OF 16"].to_f + row["ELITE 8"].to_f + row["FINAL 4"].to_f + row["FINALS"].to_f + 1
  puts "Expected games for #{name}: #{games}"
  teams.filter(:id => team_id).update(:expected_games => games)
end
