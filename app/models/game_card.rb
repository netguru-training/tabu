class GameCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :game
  belongs_to :team
end
