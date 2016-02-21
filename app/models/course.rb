class Course < ActiveRecord::Base
  has_many :users
  validates_presence_of :course_id
  validates_uniqueness_of :course_id
  validates_presence_of :start_date
  validates_presence_of :end_date
  validate :end_date_is_after_start_date
  validates_presence_of :email
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validate :change_inactive
  private
  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end

  def change_inactive
    if Time.now > self.end_date
      self.is_active = false
    end
  end
end
