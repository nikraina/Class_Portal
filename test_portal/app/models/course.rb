class Course < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates_presence_of :course_id
  validates_uniqueness_of :course_id
  validates_presence_of :start_date
  validates_presence_of :end_date
end
