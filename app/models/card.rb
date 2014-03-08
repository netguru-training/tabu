class Card < ActiveRecord::Base
  has_many :words, through: :cards_words
  validates_presence_of :title
end
