class CreateChatroomsUsers < ActiveRecord::Migration
  def change
    create_table :chatrooms_users do |t|
      t.integer :user_id
      t.integer :chatroom_id
    end

    add_column :users, :registered, :boolean
  end
end
