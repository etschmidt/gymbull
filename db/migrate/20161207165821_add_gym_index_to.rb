class AddGymIndexTo < ActiveRecord::Migration[5.0]
  def change
    change_table :posts do |t|
      t.references :gym, foreign_key: true
    end
    add_index :posts, [:gym_id, :created_at] 
  end
end
