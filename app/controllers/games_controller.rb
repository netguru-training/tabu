class GamesController < ApplicationController
  expose :game, attributes: :game_attributes
  def create
    
    team1 = Team.new name: params[:game][:team1_name]
    team2 = Team.new name: params[:game][:team2_name]

    game.team1 = team1

    game.team2 = team2

    if game.save
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

