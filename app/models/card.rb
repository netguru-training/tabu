class Card < ActiveRecord::Base
  has_many :words, through: :forbidden_words
  validates_presence_of :title
end
