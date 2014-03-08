class Team < ActiveRecord::Base
  has_many :game_cards
end
