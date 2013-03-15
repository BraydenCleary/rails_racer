class GameUser < ActiveRecord::Base
  attr_accessible :user_id, :game_id, :player

  belongs_to :game
  belongs_to :user

  validates :game_id, :user_id, :presence => true

  validates_uniqueness_of :game_id, :scope => [:user_id]

end
