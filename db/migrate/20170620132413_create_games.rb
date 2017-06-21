class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :activate_digest
      t.boolean :activated
      t.datetime :activated_at

      t.timestamps
    end
  end
end
