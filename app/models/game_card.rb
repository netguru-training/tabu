class GameCard < ActiveRecord::Base
  belongs_to :card
  belongs_to :game
  belongs_to :team

  def set_as_correct!
    update_attribute(:result, 1) 
  end

  def set_as_wrong!
    update_attribute(:result, -1)
  end
end
