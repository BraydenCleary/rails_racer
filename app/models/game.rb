class Game < ActiveRecord::Base
  attr_accessible :p1_position, :p2_position, :winner_id, :game_time

  has_many :game_users
  has_many :users, :through => :game_users

  validates :p1_position, :presence => true
  validates :p2_position, :presence => true


  def advance!(game_user)
    p game_user
    if game_user.player == 1
      self.update_attributes(p1_position: self.p1_position + 1) 
    else 
      self.update_attributes(p2_position: self.p2_position + 1)
    end
  end

  def locate_game_user(user_id)
    GameUser.where(:user_id => user_id,
                   :game_id => self.id).first
  end

  def finish!(winner, game_time, position)
    self.update_attributes(winner_id: winner[:id], 
                           game_time: game_time,
                           p1_position: position[:player1],
                           p2_position: position[:player2] )
  end

  def player2
    user_id = self.game_users.where(:player => 2).first.user_id
    user = User.find(user_id)
  end

  def player1
    user_id = self.game_users.where(:player => 1).first.user_id
    user = User.find(user_id)
  end

  def winner
    User.find(self.winner_id)
  end

  def loser
    loser = self.game_users.where("user_id != ?", self.winner_id).first
    User.find(loser.user_id)
  end

  def open?
    self.game_users.length < 2
  end

  def winning_margin
    (p1_position - p2_position).abs
  end
  


end
