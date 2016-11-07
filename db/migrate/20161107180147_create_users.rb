class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :location
      t.text :about
      t.integer :height
      t.integer :weight
      t.text :goals
      t.text :prs
      t.text :quals

      t.timestamps
    end
  end
end
