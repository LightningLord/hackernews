require 'spec_helper'

describe "Users", :js => false do
  describe "root page" do
    before(:each){visit root_path}
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
end
