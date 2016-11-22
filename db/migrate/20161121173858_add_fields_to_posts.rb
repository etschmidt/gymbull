class AddFieldsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :carbs, :integer
    add_column :posts, :fat, :integer
    add_column :posts, :protein, :integer
  end
end
