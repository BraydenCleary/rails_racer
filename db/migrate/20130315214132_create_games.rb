class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :p1_position, :null => false
      t.integer :p2_position, :null => false
      t.integer :winner_id
      t.integer :game_time 

      t.timestamps
    end
  end
end
