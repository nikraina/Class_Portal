class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.column :course_id, :string, :limit => 100, :null => false
      t.column :email, :string, :limit => 100
      t.timestamps
    end
  end
end
