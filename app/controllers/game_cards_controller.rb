class GameCardsController < ApplicationController
  expose :game_card
  def next_round
    game_card.game = current_game
    game_card.team = current_team
    game_card.card = current_card
    game_card.save
  end
end