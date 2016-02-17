class CreateCourses < ActiveRecord::Migration
  def change

      create_table :courses do |t|
        t.column :course_id, :string, :limit => 100, :null => false
        t.column :title, :string, :limit => 100
        t.column :description, :string, :limit => 100
        t.column :materials, :string
        t.column :is_active, :bool
        t.date :start_date
        t.date :end_date
        t.timestamps null: false
      end
  end
end
