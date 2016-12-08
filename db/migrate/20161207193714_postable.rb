class Postable < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :postable_id, :integer
    add_column :posts, :postable_type, :string
  end
end
