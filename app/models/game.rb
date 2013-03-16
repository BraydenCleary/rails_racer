class Game < ActiveRecord::Base
  attr_accessible :p1_position, :p2_position, :winner_id, :game_time

  has_many :game_users
  has_many :users, :through => :game_users

  validates :p1_position, :presence => true
  validates :p2_position, :presence => true


  def advance!(user)
    
    # if game_user.player == 1
    #   self.p1_position += 1 
    # else 
    #   self.p2_position += 1
    # end
  end

  def locate_game_user(user_id)
    GameUser.where(:user_id => user_id,
                   :game_id => self.id).first
  end

end
