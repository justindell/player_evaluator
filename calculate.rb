require 'sequel'

class Calculate
  DB = Sequel.sqlite('players.sqlite')

  class << self
    def points_per_game opts = {}
      puts opts.inspect
      format = "%-40s%-40s%0.4f    %s\n"
      opponent_rpi = blank?(opts['opponent_rpi']) ? 100 : opts['opponent_rpi']
      team_rpi = blank?(opts['team_rpi']) ? 100 : opts['team_rpi']
      min_games = blank?(opts['min_games']) ? 0 : opts['min_games']

      query = DB[:boxscores].select(:players__id.as(:id),
                                    :players__name.as(:player),
                                    :players__drafted.as(:drafted),
                                    :teams__name.as(:team),
                                    :teams__rpi.as(:team_rpi),
                                    :teams__seed.as(:seed)).
                            select_more{[avg(:boxscores__points).as(:points), count(:boxscores__points).as(:games)]}.
                            join(:teams, {:id => :opponent_id}, {:table_alias => :opponents}) {|o,b,js| :rpi.qualify(o) <= opponent_rpi}.
                            join(:players, :id => :boxscores__player_id).
                            group(:players__name, :players__drafted, :teams__name).
                            having{count(:boxscores__points) >= min_games}.
                            order{avg(:boxscores__points).desc}
      query = if blank?(opts['team_id'])
                if blank?(opts['seed'])
                  query.join(:teams, :id => :players__team_id) {|t,b,js| :rpi.qualify(t) <= team_rpi}
                else
                  query.join(:teams, :id => :players__team_id) {|t,b,js| :seed.qualify(t) <= opts['seed']}
                end
              else
                query.join(:teams, :id => :players__team_id){|t,b,js| {:id.qualify(t) => opts['team_id']}}
              end
      puts query.inspect
      query
    end

    def draft player_id
      puts "drafting #{player_id}"
      DB[:players].filter(:id => player_id).update(:drafted => true)
    end

    def teams
      DB[:teams].all
    end

    private
    def blank? obj
      obj.nil? || obj.empty?
    end
  end
end
