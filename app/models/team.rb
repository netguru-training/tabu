class Team < ActiveRecord::Base
  has_many :game_cards

  def score
  	game_cards.sum(:result)
  end
end
