require 'rubygems'
require 'sequel'

DB = Sequel.sqlite('players.sqlite')

DB.create_table :players do
  primary_key :id
  foreign_key :team_id
  String :name
  String :reference_id, :unique => true
  TrueClass :drafted, :default => false
end

DB.create_table :teams do
  primary_key :id
  String :name
  String :reference_id, :unique => true
  Integer :rpi
  Integer :seed
end

DB.create_table :games do
  primary_key :id
  String :reference_id, :unique => true
  Integer :home_team
  Integer :away_team
end

DB.create_table :boxscores do
  primary_key :id
  foreign_key :player_id
  foreign_key :game_id
  foreign_key :opponent_id, :teams
  String :result
  Integer :points
end

DB.create_table :seed_results do
  Integer :seed
  Integer :wins
  Integer :losses
end

DB[:seed_results].insert(:seed => 1, :wins => 364, :losses => 92)
DB[:seed_results].insert(:seed => 2, :wins => 262, :losses => 104)
DB[:seed_results].insert(:seed => 3, :wins => 201, :losses => 104)
DB[:seed_results].insert(:seed => 4, :wins => 159, :losses => 107)
DB[:seed_results].insert(:seed => 5, :wins => 128, :losses => 108)
DB[:seed_results].insert(:seed => 6, :wins => 128, :losses => 107)
DB[:seed_results].insert(:seed => 7, :wins => 89, :losses => 108)
DB[:seed_results].insert(:seed => 8, :wins => 75, :losses => 107)
DB[:seed_results].insert(:seed => 9, :wins => 62, :losses => 108)
DB[:seed_results].insert(:seed => 10, :wins => 70, :losses => 108)
DB[:seed_results].insert(:seed => 11, :wins => 58, :losses => 108)
DB[:seed_results].insert(:seed => 12, :wins => 56, :losses => 108)
DB[:seed_results].insert(:seed => 13, :wins => 27, :losses => 108)
DB[:seed_results].insert(:seed => 14, :wins => 18, :losses => 108)
DB[:seed_results].insert(:seed => 15, :wins => 4, :losses => 108)
DB[:seed_results].insert(:seed => 16, :wins => 0, :losses => 108)

DB.add_index :players, :id
DB.add_index :teams, :id
DB.add_index :games, :id
DB.add_index :boxscores, :id
DB.add_index :boxscores, [:player_id, :game_id], :unique => true
