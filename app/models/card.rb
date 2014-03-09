class Card < ActiveRecord::Base
  has_many :words, through: :forbidden_words
  has_many :forbidden_words
  has_many :game_cards
  
  accepts_nested_attributes_for :words
  validates_presence_of :title

end
