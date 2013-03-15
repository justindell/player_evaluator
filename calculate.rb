require 'sequel'

class Calculate
  DB = Sequel.sqlite('players.sqlite')
  #ACTUAL = Sequel.sqlite('actual.sqlite3')

  class << self
    def points_per_game opts = {}
      puts opts.inspect
      format = "%-40s%-40s%0.4f    %s\n"
      opponent_rpi = opts['opponent_rpi'].empty? ? 100 : opts['opponent_rpi']
      min_games = opts['min_games'].empty? ? 0 : opts['min_games']

      query = DB[:boxscores].select(:players__id.as(:id),
                                    :players__name.as(:player),
                                    :players__drafted.as(:drafted),
                                    :teams__name.as(:team),
                                    :teams__rpi.as(:team_rpi),
                                    :teams__seed.as(:seed)).
                            select_more{[avg(:boxscores__points).as(:points), count(:boxscores__points).as(:games)]}.
                            group(:players__name, :players__drafted, :teams__name).
                            having{count(:boxscores__points) >= min_games.to_i}.
                            order{avg(:boxscores__points).desc}
      query = opts['opponent_rpi'].empty? ?
        query.join(:teams, {:id => :opponent_id}, {:table_alias => :opponents}) :
        query.join(:teams, {:id => :opponent_id}, {:table_alias => :opponents}) {|o,b,js| :rpi.qualify(o) <= opponent_rpi}
      query = if opts['team_id'].empty?
                opts['seed'].empty? ?
                  query.join(:teams, :id => :players__team_id) {|t,b,js| :seed.qualify(t) <= 16} :
                  query.join(:teams, :id => :players__team_id) {|t,b,js| :seed.qualify(t) <= opts['seed']}
              else
                query.join(:teams, :id => :players__team_id){|t,b,js| {:id.qualify(t) => opts['team_id']}}
              end
      query = query.join(:players, :id => :boxscores__player_id)
      query = query.filter(~{:players__drafted => true}) if opts['hide_drafted']
      puts query.inspect
      query
    end

    def expected_wins seed
      results = DB[:seed_results].filter(:seed => seed).first
      pct = results[:wins] / (results[:wins] + results[:losses]).to_f
      return pct*(pct*(pct*(pct*(pct*(pct + 6) - 5*pct + 5) - 4*pct + 4) - 3*pct + 3) - 2*pct + 2) - pct*(pct - 1)
    end

    #def actual_points
      #ACTUAL[:players].join(:boxscores, :player_id => :id).select(:players__first_name, :players__last_name, :SUM.sql_function(:points).as(:sum)).group(:players__first_name, :players__last_name).all
    #end

    def draft player_id
      puts "drafting #{player_id}"
      DB[:players].filter(:id => player_id).update(:drafted => true)
    end

    def teams
      DB[:teams].all
    end
  end
end
