class ForbiddenWords < ActiveRecord::Migration
  def change
  	create_join_table :cards, :words
  end
end
