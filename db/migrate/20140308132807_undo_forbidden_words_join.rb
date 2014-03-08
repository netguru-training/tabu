require_relative '20140308123631_forbidden_words'
class UndoForbiddenWordsJoin < ActiveRecord::Migration
  def change
  	revert ForbiddenWords
  end
end
