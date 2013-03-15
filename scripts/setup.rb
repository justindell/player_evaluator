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
  Decimal :average_wins
end

DB[:seed_results].insert(:seed => 1,  :wins => 426, :losses => 117, :average_wins => 3.38)
DB[:seed_results].insert(:seed => 2,  :wins => 307, :losses => 130, :average_wins => 2.42)
DB[:seed_results].insert(:seed => 3,  :wins => 232, :losses => 131, :average_wins => 1.86)
DB[:seed_results].insert(:seed => 4,  :wins => 188, :losses => 135, :average_wins => 1.49)
DB[:seed_results].insert(:seed => 5,  :wins => 158, :losses => 136, :average_wins => 1.16)
DB[:seed_results].insert(:seed => 6,  :wins => 166, :losses => 134, :average_wins => 1.17)
DB[:seed_results].insert(:seed => 7,  :wins => 113, :losses => 136, :average_wins => 0.83)
DB[:seed_results].insert(:seed => 8,  :wins => 102, :losses => 135, :average_wins => 0.70)
DB[:seed_results].insert(:seed => 9,  :wins => 76,  :losses => 136, :average_wins => 0.56)
DB[:seed_results].insert(:seed => 10, :wins => 89,  :losses => 136, :average_wins => 0.65)
DB[:seed_results].insert(:seed => 11, :wins => 67,  :losses => 132, :average_wins => 0.54)
DB[:seed_results].insert(:seed => 12, :wins => 61,  :losses => 132, :average_wins => 0.52)
DB[:seed_results].insert(:seed => 13, :wins => 29,  :losses => 112, :average_wins => 0.26)
DB[:seed_results].insert(:seed => 14, :wins => 18,  :losses => 112, :average_wins => 0.16)
DB[:seed_results].insert(:seed => 15, :wins => 6,   :losses => 112, :average_wins => 0.05)
DB[:seed_results].insert(:seed => 16, :wins => 0,   :losses => 112, :average_wins => 0.00)

DB.add_index :players, :id
DB.add_index :teams, :id
DB.add_index :games, :id
DB.add_index :boxscores, :id
DB.add_index :boxscores, [:player_id, :game_id], :unique => true
