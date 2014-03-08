class CreateGameCards < ActiveRecord::Migration
  def change
    create_table :game_cards do |t|
      t.belongs_to :card, index: true
      t.belongs_to :game, index: true
      t.belongs_to :team, index: true
      t.integer :result

      t.timestamps
    end
  end
end
