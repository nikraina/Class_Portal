class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.column :email, :string, :limit => 100, :null => false
      t.column :password, :string, :limit => 100, :null => false
      t.column :name, :string, :limit => 100, :null => false
      t.column :is_admin, :boolean
      t.column :is_instructor, :boolean
      t.timestamps null: false

    end
  end
end
