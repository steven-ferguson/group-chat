class User < ActiveRecord::Base
  before_save :register
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :participations
  has_many :chatrooms, through: :participations
  has_many :owned_chatrooms, :class_name => "Chatroom", :foreign_key => "owner_id"

private
  def register
    self.registered = true
  end
end
