class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :remember_token
  has_secure_password
end
