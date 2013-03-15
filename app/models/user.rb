class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token
  has_secure_password

  has_many :games, :through => :game_users
  has_many :game_users

  validates :name,  :presence => true
  validates :email, :presence => true, :uniqueness => true
end
