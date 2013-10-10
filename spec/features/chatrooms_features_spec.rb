require 'spec_helper'

feature "Create a chatroom" do
  scenario "a user creates a valid chatroom" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit chatrooms_path
    click_link "New Room"
    fill_in "chatroom_name", with: "Test Chat"
    click_on "Create"
    page.should have_content "successfully"
    page.should have_content "Test Chat"
  end

  scenario "a user submits an invalid chatroom" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit chatrooms_path
    click_link "New Room"
    click_on  "Create"
    page.should have_content "can't"
  end

  scenario "a non-registered user" do 
    visit chatrooms_path
    page.should_not have_content "New Room"
  end

  scenario "a non-registered user directly visits the new chatroom path" do 
    visit new_chatroom_path
    page.should have_content "Unauthorized"
  end
end

feature "Visit a chatroom" do
  scenario "a user visits a chatroom they a member of" do
    chatroom = FactoryGirl.create(:chatroom)
    user = FactoryGirl.create(:user)
    chatroom.users << user
    login_as(user, :scope => :user)
    visit chatroom_path(chatroom)
    page.should have_title "Test Chat"
  end

  scenario "a user visits a chatroom of which they are not a member" do
    chatroom = FactoryGirl.create(:chatroom)
    visit chatroom_path(chatroom)
    page.should have_content "Unauthorized"
  end
end

feature "Add a friend to a chatroom" do
  scenario "a chatroom owner adds an existing user to a chatroom" do 
    user = FactoryGirl.create(:user)
    chatroom = FactoryGirl.create(:chatroom)
    login_as(chatroom.owner, :scope => :user)
    visit chatroom_path(chatroom)
    click_link 'Add Friend'
    fill_in 'user_email', :with => user.email
    click_on 'Add'
    page.should have_content 'successfully' 
  end

  scenario "a chatroom owner adds an non-existing user to a chatroom" do 
    chatroom = FactoryGirl.create(:chatroom)
    login_as(chatroom.owner, :scope => :user)
    visit chatroom_path(chatroom)
    click_link 'Add Friend'
    fill_in 'user_email', :with => "none@none.com"
    click_on 'Add'
    page.should have_content 'does not exist'
  end

  scenario "a member of the chatroom who is not an owner tries to add a member" do 
    chatroom = FactoryGirl.create(:chatroom)
    user = FactoryGirl.create(:user)
    chatroom.participations.create(user: user)
    login_as(user, :scope => :user)
    visit chatroom_path(chatroom)
    page.should_not have_content 'Add Friend'

    visit new_participation_path(chatroom_id: chatroom.id)
    page.should have_content('Unauthorized')
  end
end




















