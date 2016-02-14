class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text "course_number", :limit =>25
      t.text "title", :limit =>25
      t.text "description"
      t.text "status", :limit =>25
      t.datetime "start_date"
      t.datetime "end_date"
      t.timestamps
    end
  end
end
