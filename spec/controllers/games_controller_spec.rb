require 'spec_helper'

describe GamesController do
  describe "POST create" do
    before do
        @game_params = {
          :team1_name => "Aaaby",
          :team2_name => "Bbbcz",
          :name => "Lorem ipsum"
          }
    end
    context "good params" do
      
      it "adds two new teams" do
        expect {
          post :create, game: @game_params
          }.to change(Team.all, :count).by(2)
      end
      it "creates new game once" do
        expect {
          post :create, game: @game_params
          }.to change(Game.all, :count).by(1)
      end
      it "should redirect to game/:id page" do
        post :create, game: @game_params
        response.should redirect_to game_path(controller.game)
      end
      
    end
    context "empty" do
      context "all fields" do
        before do
          @game_params = {
            :team1_name => "",
            :team2_name => "",
            :name => ""
            }
        end
        it "not adds two new teams" do
          expect {
            post :create, game: @game_params
            }.not_to change(Team.all, :count).by(2)
        end
        it "not creates new game once" do
          expect {
            post :create, game: @game_params
            }.not_to change(Game.all, :count).by(1)
        end
        it "should render new game form again" do
          post :create, game: @game_params
          response.body.should render_template("games/new")
        end
      end
    end
  end
end