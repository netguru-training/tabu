class GameCardsController < ApplicationController
  expose :game_card
  
  def next_round
    game_card.game = current_game
    # game_card.team = current_team
    game_card.card = sample_card
    game_card.save
  end

  def sample_card
    Card.order("random()").first()
  end
end