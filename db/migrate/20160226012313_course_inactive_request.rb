class CourseInactiveRequest < ActiveRecord::Migration
  def change
    create_table :course_inactive_request do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.timestamps
    end
  end
end
