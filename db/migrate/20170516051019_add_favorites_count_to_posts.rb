class AddFavoritesCountToPosts < ActiveRecord::Migration[5.0]
  def change
    change_table :posts do |t|
      t.integer :favorites_count, default: 0
    end

    reversible do |dir|
      dir.up { data }
    end
  end

  def data
    execute <<-SQL.squish
        UPDATE posts
           SET favorites_count = (SELECT count(1)
                                   FROM favorites
                                  WHERE favorites.favorited_id = posts.id)
    SQL
  end
end