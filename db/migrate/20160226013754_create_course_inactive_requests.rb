class CreateCourseInactiveRequests < ActiveRecord::Migration
  def change
    drop_table :course_inactive_request
    create_table :course_inactive_requests do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.timestamps
    end
  end
end
