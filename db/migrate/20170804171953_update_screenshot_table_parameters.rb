class UpdateScreenshotTableParameters < ActiveRecord::Migration[5.1]
  def change
    rename_column :screenshots, :game_id_id, :game_id
  end
end
