class AddGameToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :game, index: true
  end
end
