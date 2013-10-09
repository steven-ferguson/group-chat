require 'spec_helper'

feature "Create a chatroom" do
  scenario "a user creates a valid chatroom" do
    visit chatrooms_path
    click_link "New Room"
    fill_in "chatroom_name", with: "Test Chat"
    click_on "Create"
    page.should have_content "successfully"
    page.should have_content "Test Chat"
  end

  scenario "a user submits an invalid chatroom" do
    visit chatrooms_path
    click_link "New Room"
    click_on  "Create"
    page.should have_content "can't"
  end
end

feature "Visit a chatroom" do
  scenario "a user visits a chatroom" do
    chatroom = FactoryGirl.create(:chatroom)
    visit chatrooms_path
    click_link "Test Chat"
    page.should have_title "Test Chat"
  end
end