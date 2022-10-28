class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_location, null: false
      t.string :rule_name, null: false
      t.string :rule_value, null: false
      t.boolean :multiple, null: false
      t.string :description

      t.index [:rule_name, :rule_value], unique: true
      t.timestamps
    end
  end
end
