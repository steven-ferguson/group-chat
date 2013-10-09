class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end
end
