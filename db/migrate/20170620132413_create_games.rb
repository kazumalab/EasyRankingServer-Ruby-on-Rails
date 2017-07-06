class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :access_token_digest
      t.string :access_key
      t.datetime :access_token_created_at

      t.timestamps
    end
  end
end
