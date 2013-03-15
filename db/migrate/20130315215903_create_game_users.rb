class CreateGameUsers < ActiveRecord::Migration
  def change
    create_table :game_users do |t|
      t.integer :user_id, :null => false
      t.integer :game_id, :null => false
      t.integer :player,  :null => false

      t.timestamps
    end
  end
end
