require 'sequel'

class Calculate
  DB = Sequel.sqlite('players.sqlite')

  class << self
    def points_per_game opts = {}
      opponent_rpi = opts['opponent_rpi'].empty? ? 100 : opts['opponent_rpi']
      min_games = opts['min_games'].empty? ? 0 : opts['min_games']
      seed = opts['seed'].empty? ? 16 : opts['seed']
      seed_join = opts['team_id'].empty? ? lambda{|t,b,js| Sequel.qualify(t, :seed) <= seed} : lambda{|t,b,js| { Sequel.qualify(t, :id) => opts['team_id']}}
      team_join = opts['opponent_rpi'].empty? ? lambda{|o,b,js| {1 => 1}} : lambda{|o,b,js| Sequel.qualify(o, :rpi_rank) <= opponent_rpi}
      draft_filter = opts['hide_drafted'].nil? ? {true => true}  : {:players__drafted => false}

      DB[:boxscores].select(:players__id___id,
                            :players__name___player,
                            :players__drafted___drafted,
                            :teams__name___team,
                            :teams__rpi_rank___team_rpi,
                            :teams__seed___seed,
                            :teams__expected_games___silver_games).
                    select_more{[avg(:boxscores__points).as(:points), count(:boxscores__points).as(:games)]}.
                    group(:players__name, :players__drafted, :teams__name).
                    having{count(:boxscores__points) >= min_games.to_i}.
                    order{avg(:boxscores__points).desc}.
                    join(:teams, {:id => :opponent_id}, {:table_alias => :opponents}) {|o,b,js| team_join.call(o,b,js)}.
                    join(:teams, :id => :players__team_id) {|t,b,js| seed_join.call(t,b,js)}.
                    join(:players, :id => :boxscores__player_id).
                    where(draft_filter)
    end

    def draft player_id
      DB[:players].filter(:id => player_id).update(:drafted => true)
    end

    def teams
      DB[:teams].all
    end
  end
end
