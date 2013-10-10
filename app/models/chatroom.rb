class Chatroom < ActiveRecord::Base
  after_create :add_owner_to_users
  validates :name, presence: true, length: { maximum: 50 }
  has_many :participations
  has_many :users, through: :participations
  belongs_to :owner, class_name: "User"

private
  def add_owner_to_users
    participations.create(user: owner)
  end
end
