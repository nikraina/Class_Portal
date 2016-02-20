class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :email, :string, :limit => 100
      t.column :password, :string, :limit => 100
      t.column :name, :string, :limit => 100
      t.boolean :is_admin
      t.boolean :is_instructor
      t.timestamps
    end
  end
end
