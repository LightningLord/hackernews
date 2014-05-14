require 'spec_helper'

describe "Users", :js => false do
  describe "root page" do
    it "renders a sign up form" do
      visit root_path
      expect(page).to have_content "Sign Up"
    end
  end
end
