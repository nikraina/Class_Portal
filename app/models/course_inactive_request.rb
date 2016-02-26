class CourseInactiveRequest < ActiveRecord::Base
  validates_uniqueness_of :course_id
end
