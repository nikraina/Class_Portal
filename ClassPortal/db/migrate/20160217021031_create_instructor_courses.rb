class CreateInstructorCourses < ActiveRecord::Migration
  def change
    create_table :instructor_courses do |t|

      t.timestamps
    end
  end
end
