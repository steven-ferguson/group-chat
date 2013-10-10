require 'spec_helper'

describe Chatroom do
  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most(50) }
  it { should belong_to :owner }
  it { should have_many(:users).through(:participations) }
  
  it "adds the owner to the list of users when created" do 
    chatroom = FactoryGirl.build(:chatroom)
    chatroom.save
    chatroom.users.should eq [chatroom.owner]
  end
end
