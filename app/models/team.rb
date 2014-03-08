class Team < ActiveRecord::Base
  has_many :game_cards
  belongs_to :game
end
