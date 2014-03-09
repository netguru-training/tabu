class GameCardsController < ApplicationController
  expose :game_card
  before_filter :vote, only: :next_round
  before_filter :sample_card, only: :next_round
  def next_round

    game_card.game = current_game
    game_card.team = select_team
    game_card.card = @sample_card
    game_card.save
    set_last_game_card(game_card)
  end

  private
    def vote
      if params[:result] == "1"
        last_game_card.set_as_correct!
      elsif params[:result] == "-1"
        last_game_card.set_as_wrong!
      end
    end

    def select_team
      current_game.game_cards.count % 10 > 5 ? current_game.team1 : current_game.team2
    end


    def sample_card
      @sample_card = Card.order("random()").to_a.delete_if { |c| current_game.game_cards.map(&:card_id).include? c.id }.first
      redirect_to game_results_path(current_game) unless @sample_card
    end
end