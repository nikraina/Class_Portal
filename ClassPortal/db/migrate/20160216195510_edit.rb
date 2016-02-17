class Edit < ActiveRecord::Migration
    def change
      drop_table :users
      create_table :users do |t|


        t.column :email, :string, :limit => 100
        t.column :password, :string, :limit => 100
        t.column :name, :string, :limit => 100
        t.column :is_admin, :boolean
        t.column :is_instructor, :boolean
        t.timestamps


        t.timestamps
      end
    end
end
