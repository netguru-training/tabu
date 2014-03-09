class Game < ActiveRecord::Base
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  has_many :game_cards 

  attr_accessor :team1_name, :team2_name
  
  validates_presence_of :name

  def complete_name
    "#{team1.name} vs #{team2.name}"
  end

  def score_for(team)
   team.game_cards.sum(:result)
  end
end
