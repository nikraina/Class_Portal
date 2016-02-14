class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.text "first_name", :limit => 25
      t.text "last_name", :limit => 25
      t.text "email", :default =>"", :null=>false, :limit => 40
      t.text "password", :limit => 25
      t.timestamps
      t.references :courses
    end
  end
end
