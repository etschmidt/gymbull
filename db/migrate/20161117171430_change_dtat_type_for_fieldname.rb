class ChangeDtatTypeForFieldname < ActiveRecord::Migration[5.0]
    def self.up
    change_table :posts do |t|
      t.change :duration, :integer
    end
  end
  def self.down
    change_table :posts do |t|
      t.change :duration, :time
    end
  end
end