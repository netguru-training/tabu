class Team < ActiveRecord::Base
  has_many :game_cards
  belongs_to :game

  def score
  	game_cards.sum(:result)
  end
end
