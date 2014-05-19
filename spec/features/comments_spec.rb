require 'spec_helper'
describe "comments", :js => false do
  describe "on the post show page" do
    let(:ned_stark){FactoryGirl.create(:user)}
    let(:tyrion){FactoryGirl.create(:user)}
    let(:new_post){FactoryGirl.create(:post, :user => ned_stark)}
    let!(:new_comment){FactoryGirl.create(:comment, :user=> tyrion, :post=> new_post)}
    context "any user" do
      it "can see all of the comments for a post" do
        visit post_path(new_post)
        expect(page).to have_content(new_comment.content)
      end
    end
    context "logged in user" do
      before(:each) do
        visit new_session_path
        fill_in "name", :with => ned_stark.name
        fill_in "password", :with => ned_stark.password
        click_button "Log in"
      end
      it "can comment on a post" do
        visit post_path(new_post)
        save_and_open_page
        fill_in "comment[content]", :with => "Hear me roar"
        click_button "Comment on this post"
        expect(page).to have_content "Hear me roar"
      end
      it "can edit own comment"
      it "can delete own comment"
    end
  end
end
