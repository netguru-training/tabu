class Word < ActiveRecord::Base
  validates_presence_of :value
end
