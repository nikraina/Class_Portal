class Course < ActiveRecord::Base
  validates_presence_of :course_number
  validates_presence_of :title
  validates_presence_of :status
  validates_uniqueness_of :course_number, :message => "Course Number must be Unique"
  validates :status, inclusion: {in: %w(Active Inactive)}, :message => "Status must be Active or Inactive"
  validate :end_date_more_than_start_date

  def end_date_more_than_start_date
    errors.add(:end_date, "Should not be less than Start Date") if end_date < start_date
  end
end
