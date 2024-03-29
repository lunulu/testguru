class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :gist_id, null: false

      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.timestamps
    end
  end
end
