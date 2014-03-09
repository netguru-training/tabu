class Word < ActiveRecord::Base
  has_many :forbidden_words
  validates_presence_of :value
end
