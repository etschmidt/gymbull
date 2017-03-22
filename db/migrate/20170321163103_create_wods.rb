class CreateWods < ActiveRecord::Migration[5.0]
  def change
    create_table :wods do |t|

      t.timestamps
    end
  end
end
