class ChangeGym < ActiveRecord::Migration[5.0]
  def self.up
  change_table :gyms do |t|
    t.change :gym_admin, :integer
    end
  end
  def self.down
    change_table :gyms do |t|
      t.change :gym_admin, :string
    end
  end
end