class RemoveDefaultValsFromTables < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :rating, :integer => 0
  end
end
