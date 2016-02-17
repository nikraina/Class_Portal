class StudentCourse < ActiveRecord::Base
  validates_presence_of :course_id
  validates_presence_of :email
  validates_uniqueness_of :course_id, :scope => [:email]
end

