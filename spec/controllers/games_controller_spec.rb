require 'spec_helper'

shared_examples_for 'valid' do
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
    response.should redirect_to next_round_path
  end
end

shared_examples_for 'invalid' do
  it "does not add two new teams" do
    expect {
      post :create, game: @game_params
      }.not_to change(Team.all, :count).by(2)
  end
  it "does not create new game once" do
    expect {
      post :create, game: @game_params
      }.not_to change(Game.all, :count).by(1)
  end
  it "should render new game form again" do
    post :create, game: @game_params
    response.body.should render_template("games/new")
  end
end

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
      it_behaves_like 'valid', true
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
      context "game name field empty" do
        before do
          @game_params[:name] = ""
        end
         it_behaves_like 'invalid', true
      end
      context "Team name field empty" do
        before do
          @game_params[:team1_name] = ""
          @game_params[:team2_name] = ""
        end
        it_behaves_like 'invalid', true
      end
    end
    context "First of team name fields empty" do
        before do
          @game_params[:team1_name] = ""
        end
        it_behaves_like 'invalid', true
      end
    context "Second of team name fields empty" do
        before do
          @game_params[:team2_name] = ""
        end
        it_behaves_like 'invalid', true
      end
    end
  end
end