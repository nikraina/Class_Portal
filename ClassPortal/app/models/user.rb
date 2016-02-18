class User < ActiveRecord::Base
  has_many :courses
  validates_presence_of :email, :password
  validates_uniqueness_of :email
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
