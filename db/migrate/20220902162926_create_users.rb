class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :score, default: 0
      t.integer :age, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
