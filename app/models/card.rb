class Card < ActiveRecord::Base
  validate_presence_of :title
end
