class CreateScreenshots < ActiveRecord::Migration[5.1]
  def change
    create_table :screenshots do |t|
      t.string :title
      t.string :image
      t.references :game_id

      t.timestamps
    end
  end
end
