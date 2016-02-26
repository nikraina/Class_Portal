class UpdateStudentCourses < ActiveRecord::Migration
  def change
    drop_table :student_courses
    create_table :student_courses do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.column :email, :string, :limit => 100, :null =>false
      t.column :grade, :string, :limit => 1
      t.boolean :is_curr_enrolled, :default => false
      t.boolean :has_requested, :default => false
      t.boolean :is_denied, :default => false
      t.timestamps
    end
  end
end
