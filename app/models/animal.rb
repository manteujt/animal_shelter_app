class Animal < ActiveRecord::Base
  attr_accessible :age, :description, :dog, :name
  
  validates :name, :presence => true, :uniqueness => true
  validates :age, :presence => true
  validates :description, :presence => true
  
  scope :dog, where("dog=?", true)
  scope :cat, where("dog=?", false)
  scope :by_age, order("age ASC")
end
