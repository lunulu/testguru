class RemoveAgeColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :age, :integer, null: false
  end
end
