class Course < ActiveRecord::Base
  has_many :users
  validates_presence_of :course_id
  validates_uniqueness_of :course_id
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :email
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
