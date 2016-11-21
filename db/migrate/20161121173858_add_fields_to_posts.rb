class AddFieldsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :carbs, :number
    add_column :posts, :fat, :number
    add_column :posts, :protein, :number
  end
end
