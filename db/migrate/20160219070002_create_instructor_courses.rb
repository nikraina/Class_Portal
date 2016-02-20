class CreateInstructorCourses < ActiveRecord::Migration
  def change
    create_table :instructor_courses do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.column :email, :string, :limit => 100, :null =>false
      t.timestamps
    end
  end
end
