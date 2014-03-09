class GamesController < ApplicationController
  expose :game, attributes: :game_attributes
  def create

    team1 = Team.new name: params[:game][:team1_name], game_id: game.id
    team2 = Team.new name: params[:game][:team2_name], game_id: game.id

    if %w(team1 team2 game).all? { |e| eval(e).valid? }
      %w(team1 team2 game).each { |e| eval(e).save }

      set_current_game game
      redirect_to game
    else
      render :new
    end
  end

  def show
    
  end

  def results
  end

  private
    def game_attributes
      params.require(:game).permit(:name)
    end
end

