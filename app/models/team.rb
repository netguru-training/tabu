class Team < ActiveRecord::Base
  has_many :game_cards
  belongs_to :game

  validates_presence_of :name
end
