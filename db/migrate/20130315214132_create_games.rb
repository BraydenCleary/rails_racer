class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :p1_position
      t.integer :p2_position
      t.integertime :winner_id

      t.timestamps
    end
  end
end
