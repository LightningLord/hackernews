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
    let(:ned_stark){FactoryGirl.create(:user)}
    it "links to a login page" do
      visit root_path
      expect(page).to have_link "Log in"
    end

    it "shows a login form" do
      visit new_session_path
      expect(page).to have_content "Name"
      expect(page).to have_content "password"
    end

    it "allows a user to log in" do
      visit new_session_path
      fill_in "name", :with => ned_stark.name
      fill_in "password", :with => ned_stark.password
      click_button "Log in"
      expect(page).to have_content "Log out"
    end
  end

end
