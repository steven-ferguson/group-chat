require 'spec_helper'

describe User do
  it { should have_many(:chatrooms).through(:participations) }
  it { should have_many :owned_chatrooms }
  it "sets the user to registered when saved" do 
    user = FactoryGirl.build(:user)
    user.registered?.should eq false 
    user.save
    user.registered.should eq true
  end
end