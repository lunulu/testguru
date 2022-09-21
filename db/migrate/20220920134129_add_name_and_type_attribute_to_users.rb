class AddNameAndTypeAttributeToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string, null: false, default: ''
    remove_column :users, :score, :integer, default: 0

    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_index :users, :type
  end
end
