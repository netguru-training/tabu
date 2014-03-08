class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :team1_id
      t.integer :team2_id
      t.timestamps
    end
  end
end
