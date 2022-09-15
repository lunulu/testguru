class RemoveColumnCompletedFromTestPassages < ActiveRecord::Migration[5.2]
  def change
    remove_column :test_passages, :completed
  end
end
