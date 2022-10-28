class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user
      t.references :badge

      t.timestamps
    end
  end
end
