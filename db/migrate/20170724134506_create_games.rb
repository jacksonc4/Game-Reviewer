class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
