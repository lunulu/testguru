class AddTestReferenceToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :correct_questions, :integer, default: 0
    add_reference :test_passages, :current_question, foreign_key: true
  end
end
