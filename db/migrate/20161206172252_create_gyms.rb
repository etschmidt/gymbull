class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :picture
      t.string :location
      t.string :focus
      t.string :email
      t.text :about
      t.text :hours
      t.text :pricing
      t.text :equipment
      t.text :classes

      t.timestamps
    end
  end
end
