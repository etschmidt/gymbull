class Comments < ActiveRecord::Migration[5.0]
  def change
    create_table "comments", force: :cascade do |t|
      t.text     "content"
      t.integer  "post_id"
      t.integer  "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["post_id"], name: "index_comments_on_post_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end
  end
end
