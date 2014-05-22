require 'spec_helper'
describe "Votes", :js => true do
  let(:ned_stark){FactoryGirl.create(:user)}
  let(:new_post){FactoryGirl.create(:post)}
  let!(:new_comment){FactoryGirl.create(:comment, :post=> new_post)}
  before(:each) do
    visit new_session_path
    fill_in "name", :with => ned_stark.name
    fill_in "password", :with => ned_stark.password
    click_button "Log in"
    visit post_path(new_post)
  end

  describe "vote on a post" do
    it "can upvote a post" do
      click_on "Upvote this post"
      wait_for_ajax_to_finish
      expect(page).to have_content "Points: #{new_post.reload.vote_count}"
    end
    it "can downvote a post" do
      click_on "Downvote this post"
      wait_for_ajax_to_finish
      expect(page).to have_content "Points: #{new_post.reload.vote_count}"
    end
  end

  describe "vote on a comment" do
    it "can upvote a comment"
    it "can downvote a comment"
  end
end
