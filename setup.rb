require 'rubygems'
require 'sequel'

DB = Sequel.sqlite('players.sqlite')

DB.create_table :players do
  primary_key :id
  String :name
  String :reference_id
  foreign_key :team_id
end

DB.create_table :teams do
  primary_key :id
  String :name
  String :reference_id
end

DB.create_table :games do
  primary_key :id
  String :reference_id
  Integer :home_team
  Integer :away_team
end

DB.create_table :boxscores do
  primary_key :id
  foreign_key :player_id
  String :reference_id
  Integer :opponent_id
  Integer :points
end
