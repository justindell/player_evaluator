require './calculate'

results = Calculate.points_per_game

puts "Player                                  Team                                    Points     Games"
results.each_with_index do |result, idx|
  puts "%-40s%-40s%0.4f    %s\n" % ["#{idx + 1}. #{result[:player]}", "#{result[:team_rpi]} #{result[:team]}", result[:points], result[:games]]
end

