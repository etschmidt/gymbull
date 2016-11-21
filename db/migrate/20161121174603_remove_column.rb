class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :macros, :string
    remove_column :posts, :exercises, :string
    remove_column :posts, :recipe, :string
  end
end
