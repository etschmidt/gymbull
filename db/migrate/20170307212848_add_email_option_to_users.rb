class AddEmailOptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_option, :boolean, default: false
  end
end
