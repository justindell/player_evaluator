require 'rubygems'
require 'sequel'

DB = Sequel.sqlite('players.sqlite')

format = "%-40s%-40s%0.4f    %s\n"

results = DB[%Q|
select p.name as player, s.name as team, s.rpi as team_rpi, avg(b.points) as points, count(b.points) as games from boxscores b
inner join teams t on t.id = b.opponent_id
inner join players p on p.id = b.player_id
inner join teams s on s.id = p.team_id
group by p.name, s.name
having t.rpi <= 100 and s.rpi <= 100 
order by avg(b.points) desc|]

puts "Player                                  Team                                    Points     Games"
results.each do |result|
  puts format % [result[:player], "#{result[:team_rpi]} #{result[:team]}", result[:points], result[:games]]
end
