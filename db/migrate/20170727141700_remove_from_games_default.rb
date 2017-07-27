class RemoveFromGamesDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :rating, :integer, :default => 0
  end
end
