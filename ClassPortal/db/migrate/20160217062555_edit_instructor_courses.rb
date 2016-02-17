class EditInstructorCourses < ActiveRecord::Migration
  def change
    drop_table :instructor_courses
    create_table :instructor_courses do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.column :email, :string, :limit => 100, :null =>false
      t.timestamps
    end
  end
end
