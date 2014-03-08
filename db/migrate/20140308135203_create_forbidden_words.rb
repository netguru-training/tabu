class CreateForbiddenWords < ActiveRecord::Migration
  def change
    create_table :forbidden_words do |t|
      t.belongs_to :card, index: true
      t.belongs_to :word, index: true

      t.timestamps
    end
  end
end
