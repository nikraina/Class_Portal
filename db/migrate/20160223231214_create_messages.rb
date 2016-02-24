class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :sender_email, :string, :limit => 100, :null =>false
      t.column :reciever_email, :string, :limit => 100, :null =>false
      t.column :msg_text, :string
      t.boolean :is_req
      t.timestamps
    end
  end
end
