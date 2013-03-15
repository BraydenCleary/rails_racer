class Game < ActiveRecord::Base
  attr_accessible :p1_position, :p2_position, :winner_id, :game_time

  has_many :game_users
  has_many :users, :through => :game_users

  validates :p1_position, :presence => true
  validates :p2_position, :presence => true

end
