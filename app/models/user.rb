class User < ActiveRecord::Base
  before_save :register
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :chatrooms

private
  def register
    self.registered = true
  end
end
