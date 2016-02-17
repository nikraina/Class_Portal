class CreateCoursesUsers < ActiveRecord::Migration
  def change
    create_table :courses_users do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.column :email, :string, :limit => 100, :null =>false
      t.column :grade, :string, :limit => 1
      t.boolean :is_curr_enrolled
    end
  end
end
