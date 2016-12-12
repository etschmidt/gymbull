class AddGymFields < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :account_type, :string
    add_column :users, :focus, :string
    add_column :users, :pricing, :text
    add_column :users, :equipment, :text
    add_column :users, :classes, :text
    add_column :users, :hours, :text
  end
end
