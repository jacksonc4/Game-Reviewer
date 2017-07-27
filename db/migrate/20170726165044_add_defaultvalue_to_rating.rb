class AddDefaultvalueToRating < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :rating, :integer, :default => 3
  end
end
