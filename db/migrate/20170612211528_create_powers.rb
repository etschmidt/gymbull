class CreatePowers < ActiveRecord::Migration[5.0]
  def change
    create_table :powers do |t|

      t.timestamps
    end
  end
end
