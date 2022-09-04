class AddUniqueIndexToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_index :test_passages, %i[user_id test_id], unique: true
  end
end
