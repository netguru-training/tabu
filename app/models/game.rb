class Game < ActiveRecord::Base
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  attr_accessor :team1_name, :team2_name
  validates_presence_of :name
end
