require 'spec_helper'

describe GamesController do
  describe "POST create" do
    context "good params" do
      before do
        @game_params = {
          :team1_name => "Aaaby",
          :team2_name => "Bbbcz",
          :name => "Lorem ipsum"
          }
      end
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
    end
    context "empty" do
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
          }.to change(Team.all, :count).by(0)
      end
      it "not creates new game once" do
        expect {
          post :create, game: @game_params
          }.to change(Game.all, :count).by(0)
      end
    end
  end
end