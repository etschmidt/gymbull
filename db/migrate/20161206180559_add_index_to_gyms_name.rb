class AddIndexToGymsName < ActiveRecord::Migration[5.0]
  def change
    add_index :gyms, :name, unique: true
  end
end
