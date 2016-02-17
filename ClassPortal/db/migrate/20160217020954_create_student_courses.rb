class CreateStudentCourses < ActiveRecord::Migration
  def change
    create_table :student_courses do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.column :email, :string, :limit => 100, :null =>false
      t.column :grade, :string, :limit => 1
      t.boolean :is_curr_enrolled
      t.boolean :has_requested
      t.boolean :is_denied
    end
  end
end
