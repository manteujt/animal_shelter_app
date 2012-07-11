class User < ActiveRecord::Base
  attr_accessible :name, :username, :password, :password_confirmation
  has_secure_password
  
  validates :name, :presence => true
  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => { :minimum => 6 }
  #validates :password_confirmation, :presence => true
end
