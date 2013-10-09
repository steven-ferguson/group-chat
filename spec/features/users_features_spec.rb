require 'spec_helper'

feature 'Register User' do
  scenario 'a user submits invalid signup informatio' do
    visit chatrooms_path
    click_link "Sign Up"
    click_on "Register"
    page.should have_content "blank"
  end

  scenario 'a user signs up successfully' do
    visit chatrooms_path
    click_link "Sign Up"
    fill_in "user_name", with: 'Steve'
    fill_in "user_email", with: 'Steve@foo.com'
    fill_in "user_password", with: "foobar11"
    fill_in "user_password_confirmation", with: "foobar11"
    click_on "Register"
    page.should have_content "successfully"
  end
end

feature 'Sign In' do
  scenario 'a user submits invalid information' do
    visit chatrooms_path
    click_link "Sign In"
    click_on "Log in"
    page.should have_content "Invalid"
  end

  scenario 'a user submits valid information' do
    user = FactoryGirl.create(:user)
    visit chatrooms_path
    click_link "Sign In"
    fill_in "user_email", with: "Steve@foo.com"
    fill_in "user_password", with: "foobar11"
    click_on "Log in"
    page.should have_content "Signed in" 
  end
end

feature 'Sign Out' do
  scenario 'a user signs out successfully' do
    user = FactoryGirl.create(:user)
    visit chatrooms_path
    click_link "Sign In"
    fill_in "user_email", with: "Steve@foo.com"
    fill_in "user_password", with: "foobar11"
    click_on "Log in"
    click_link "Sign Out"
    page.should have_content "Signed out"
  end
end