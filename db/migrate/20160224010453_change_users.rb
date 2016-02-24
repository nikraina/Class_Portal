class ChangeUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.column :email, :string, :limit => 100
      t.column :password, :string, :limit => 100
      t.column :name, :string, :limit => 100
      t.boolean :is_admin, :default => false
      t.boolean :is_instructor, :default =>false
      t.timestamps
    end
  end
end
