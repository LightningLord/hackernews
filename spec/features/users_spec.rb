require 'spec_helper'

describe "Users", :js => false do
  describe "sign up" do
    before(:each){visit new_user_path}
    it "renders a sign up form" do
      expect(page).to have_content "Sign Up"
    end
    it "allows the a new user to sign up" do
      fill_in "Name", :with => "Ned Stark"
      fill_in "Password", :with => "winter"
      click_on "Create User"
      expect(page).to have_content "Ned Stark"
    end
  end

  describe "log in" do
    it "links to a login page" do
      visit root_path
      expect(page).to have_link "Log in"
    end

    it "shows a login form" do
      visit new_session_path
      expect(page).to have_content "Name"
      expect(page).to have_content "Password"
    end
  end

end
