class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :user
      t.belongs_to :chatroom

      t.timestamps
    end

    drop_table :chatrooms_users
  end
end
