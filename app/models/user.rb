class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token
  has_secure_password

  has_many :games, :through => :game_users
  has_many :game_users

  validates :name,  :presence => true
  validates :email, :presence => true, :uniqueness => true

  def games_won
    self.games.where(:winner_id => self.id)
  end

  def games_lost
    self.games.where("winner_id != ?", self.id)
  end

  def average_game_time
    self.games.average('game_time')
  end

  def won_last_game?
    self.games.last.winner_id == self.id
  end

  def average_winning_margin
    winning_margin.to_f / self.games_won.length.to_f
  end

   def average_losing_margin
    losing_margin.to_f / self.games_lost.length.to_f
  end

  def average_total_margin
    total_margin.to_f / self.games.length.to_f 
  end

  def winning_margin
    self.games_won.inject(0) { |sum, game| sum += game.winning_margin.to_i }
  end

  def losing_margin
    self.games_lost.inject(0) { |difference, game| difference -= game.winning_margin.to_i }
  end

  def total_margin
    self.winning_margin + self.losing_margin
  end


end
