class ForbiddenWord < ActiveRecord::Base
  belongs_to :card
  belongs_to :word
end
