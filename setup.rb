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

DB.add_index :players, :id
DB.add_index :teams, :id
DB.add_index :games, :id
DB.add_index :boxscores, :id
DB.add_index :boxscores, [:player_id, :game_id], :unique => true
