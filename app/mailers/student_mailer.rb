class StudentMailer < ApplicationMailer::Base
  default from: "master@master.com"

  def notify_email(user,course)
    @user = user
    @course = course
    mail(to: @user.email, subject: "Notification regarding activation of Course #{@course.course_id}")
  end
end
