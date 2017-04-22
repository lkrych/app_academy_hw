require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_path
    expect(page).to have_content "New user"
  end

  feature "signing up a user" do

    scenario "shows email on user's page after signup" do
      visit new_user_path
      fill_in 'email', :with => "testing_email"
      fill_in 'password', :with => "password"
      click_on "Sign Up"
      expect(page).to have_content "testing_email"
    end
  end
end


feature "logging in" do
  before :each do
    User.create(email: "tunafish@bumblebee.com", password: 'password')
  end

  scenario "has a log in page" do
    visit new_session_url
    expect(page).to have_content "Log in"
  end

  scenario "shows username on the homepage after login" do
    visit new_session_url
    fill_in 'email', :with => "tunafish@bumblebee.com"
    fill_in 'password', :with => "password"
    click_on 'Log in'
    expect(page).to have_content "tunafish"
  end
end


feature "logging out" do
  before :each do
    User.create(email: "tunafish@bumblebee.com", password: 'password')
    visit new_session_url
    fill_in 'email', :with => "tunafish@bumblebee.com"
    fill_in 'password', :with => "password"
    click_on 'Log in'
  end

  scenario "doesn't show username on the homepage after logout" do
    click_on 'Log out'
    expect(page).to_not have_content "tunafish"
  end

end
