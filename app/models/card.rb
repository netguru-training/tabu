class Card < ActiveRecord::Base
  has_many :words, through: :forbidden_words
  has_many :forbidden_words
  has_many :game_cards
  
  validates_presence_of :title

end
