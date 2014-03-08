class Game < ActiveRecord::Base
  has_many :teams
  attr_accessor :team1_name, :team2_name
  validates_presence_of :name
end
