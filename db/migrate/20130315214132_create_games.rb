class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :p1_position
      t.integer :p2_position
      t.integer :winner_id
      t.integer :time
      t.timestamps
    end
  end
end
