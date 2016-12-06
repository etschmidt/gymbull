class AddGymAdminToGym < ActiveRecord::Migration[5.0]
  def change
    add_column :gyms, :gym_admin, :string
  end
end
