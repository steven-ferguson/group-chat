class Chatroom < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  has_many :participations
  has_many :users, through: :participations
  belongs_to :owner, class_name: "User"
end
