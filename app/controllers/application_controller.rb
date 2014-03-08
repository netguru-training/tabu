class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  helper_method :current_game
  def current_game
  	Game.first
  end
  def current_team
    Team.first
  end
end
