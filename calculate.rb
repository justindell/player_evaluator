require 'sequel'

class Calculate
  DB = Sequel.sqlite('players.sqlite')

  class << self
    def points_per_game opts = {}
      format = "%-40s%-40s%0.4f    %s\n"
      opponent_rpi = opts[:opponent_rpi] || 100
      team_rpi = opts[:team_rpi] || 100
      min_games = opts[:min_games] || 0

      DB[:boxscores].select(:players__id.as(:id),
                            :players__name.as(:player),
                            :players__drafted.as(:drafted),
                            :teams__name.as(:team),
                            :teams__rpi.as(:team_rpi)).
                    select_more{[avg(:boxscores__points).as(:points), count(:boxscores__points).as(:games)]}.
                    join(:teams, {:id => :opponent_id}, {:table_alias => :opponents}) {|o,b,js| :rpi.qualify(o) <= 100}.
                    join(:players, :id => :boxscores__player_id).
                    join(:teams, {:id => :players__team_id}) {|t,b,js| :rpi.qualify(t) <= 100}.
                    group(:players__name, :players__drafted, :teams__name).
                    having{count(:boxscores__points) >= 10}.
                    order{avg(:boxscores__points).desc}
    end

    def draft player_id
      puts "drafting #{player_id}"
      DB[:players].filter(:id => player_id).update(:drafted => true)
    end
  end
end
