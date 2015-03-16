require 'rubygems'
require 'sequel'
require 'json'


DB = Sequel.sqlite('players.sqlite')
teams = DB[:teams]
odds = JSON.parse(File.read('scripts/data/silver.json'))

teams.update(:expected_games => nil, :seed => nil)
odds.each do |row|
  name = row["team_name"]
  records = teams.filter("name like '#{name}%' or alternate_name like '#{name}%'").all
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
  games = row["rd2_win"].to_f + row["rd3_win"].to_f + row["rd4_win"].to_f + row["rd5_win"].to_f + row["rd6_win"].to_f + 1
  puts "Expected games for (#{row["team_seed"]}) #{name}: #{games}"
  teams.filter(:id => team_id).update(:expected_games => games, :seed => row["team_seed"])
end
