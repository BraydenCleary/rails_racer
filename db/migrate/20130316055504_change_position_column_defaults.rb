class ChangePositionColumnDefaults < ActiveRecord::Migration
  def change
    change_column_default :games, :p1_position, 1
    change_column_default :games, :p2_position, 1
  end
end
