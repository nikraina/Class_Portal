class Instructor < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email, :message => "Email already taken"
  validates_format_of :email, :with => /\A[a-z0-9.%+-]+@[a-z0-9.-]=\.[a-z]{2,4}\z/i
end
