class GameCardsController < ApplicationController
  expose :game_card
  
  def next_round
    game_card.game = current_game
    game_card.team = select_team
    game_card.card = sample_card
    if params[:result] == 1
      game_card.set_as_correct!
    else
      game_card.set_as_wrong!
    end
    game_card.save
  end

  private

    def select_team
      current_game.game_cards.count % 10 > 5 ? current_game.team1 : current_game.team2
    end


    def sample_card
      Card.order("random()").first()
    end
end