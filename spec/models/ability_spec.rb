require 'spec_helper'
require "cancan/matchers"

describe Ability do
  it 'lets a signed in user create a chatroom' do
    user = FactoryGirl.create(:user)
    ability = Ability.new(user)
    ability.should be_able_to(:create, Chatroom.new)
  end

  it 'does not let a non-signed in user create a chatroom' do 
    user = User.new
    ability = Ability.new(user)
    ability.should_not be_able_to(:create, Chatroom.new)
  end

  it "lets a user visit chatrooms they are a member of" do 
    user = FactoryGirl.create(:user)
    ability = Ability.new(user)
    chatroom = FactoryGirl.create(:chatroom)
    chatroom.users << user
    ability.should be_able_to(:read, chatroom)
  end

  it "does not a user visit chatrooms they are not a member of" do 
    user = FactoryGirl.create(:user)
    chatroom = FactoryGirl.create(:chatroom)
    ability = Ability.new(user)
    ability.should_not be_able_to(:read, chatroom)
  end

  it "allows owners of a chatroom to add their friends as members" do 
    chatroom = FactoryGirl.create(:chatroom)
    ability = Ability.new(chatroom.owner)
    ability.should be_able_to(:create, chatroom.participations.new)
  end

  it "does not allow non-owner members of a chatroom to add their friends as members" do 
    user = FactoryGirl.create(:user)
    chatroom = FactoryGirl.create(:chatroom)
    chatroom.participations.create(user: user)
    ability = Ability.new(user)
    ability.should_not be_able_to(:create, chatroom.participations.new)
  end
end
