class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :type
      t.text :content
      t.string :body_parts
      t.integer :duration
      t.text :equipment
      t.text :exercises
      t.integer :calories
      t.string :macros
      t.text :ingredients
      t.text :recipe
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
