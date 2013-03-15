class Game < ActiveRecord::Base
  attr_accessible :p1_position, :p2_position, :winner_id
end
