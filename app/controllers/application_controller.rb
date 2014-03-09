class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  helper_method :current_game, :current_team

  def current_game
  	Game.find session[:current_game_id]
  end

  def current_team
    Team.find session[:current_team_id]
  end

  def last_game_card
    GameCard.find session[:last_game_card_id]
  end

  def set_current_team(team)
    session[:current_team_id] = team.id
  end

  def set_current_game(game)
    session[:current_game_id] = game.id
  end

  def set_last_game_card(game_card)
    session[:last_game_card_id] = game_card.id 
  end
end
