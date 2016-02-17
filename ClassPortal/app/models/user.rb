class User < ActiveRecord::Base
  has_and_belongs_to_many :courses
  validates_presence_of :email, :password
  validates_uniqueness_of :email
end
