require 'sequel'

class Calculate
  DB = Sequel.sqlite('players.sqlite')

  class << self
    def points_per_game opts = {}
      format = "%-40s%-40s%0.4f    %s\n"
      opponent_rpi = opts[:opponent_rpi] || 100
      team_rpi = opts[:team_rpi] || 100
      min_games = opts[:min_games] || 0

      DB[%Q| select  p.id as id,
                      p.name as player,
                      p.drafted as drafted,
                      s.name as team,
                      s.rpi as team_rpi,
                      avg(b.points) as points,
                      count(b.points) as games
              from boxscores b
              inner join teams t on t.id = b.opponent_id and t.rpi <= #{opponent_rpi}
              inner join players p on p.id = b.player_id
              inner join teams s on s.id = p.team_id and s.rpi <= #{team_rpi}
              group by p.name, p.drafted, s.name
              having count(b.points) > #{min_games}
              order by avg(b.points) desc|]
    end

    def draft player_id
      puts "drafting #{player_id}"
      DB[:players].filter(:id => player_id).update(:drafted => true)
    end
  end
end
