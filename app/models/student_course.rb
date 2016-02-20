class StudentCourse < ActiveRecord::Base
  validates_presence_of :course_id
  validates_presence_of :email
  validates_uniqueness_of :course_id, :scope => [:email]
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
