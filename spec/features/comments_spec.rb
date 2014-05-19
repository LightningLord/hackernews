require 'spec_helper'
describe "comments", :js => true do
  describe "on the post show page" do
    let(:ned_stark){FactoryGirl.create(:user)}
    let(:tyrion){FactoryGirl.create(:user)}
    let(:new_post){FactoryGirl.create(:post, :user => ned_stark)}
    context "any user" do
      let!(:new_comment){FactoryGirl.create(:comment, :user=> tyrion, :post=> new_post)}
      it "can see all of the comments for a post" do
        visit post_path(new_post)
        expect(page).to have_content(new_comment.content)
      end
    end
    context "logged in user" do
      let!(:ned_comment){FactoryGirl.create(:comment,
        :user => ned_stark, :post => new_post)}
      before(:each) do
        visit new_session_path
        fill_in "name", :with => ned_stark.name
        fill_in "password", :with => ned_stark.password
        click_button "Log in"
        visit post_path(new_post)
      end
      it "can comment on a post" do
        fill_in "comment[content]", :with => "Hear me roar"
        click_button "Create Comment"
        wait_for_ajax_to_finish
        expect(page).to have_content "Hear me roar"
      end
      it "can edit own comment" do
        click_link "Edit Comment"
        fill_in "comment[content]", :with => "Winter is coming"
        click_on "Update Comment"
        expect(page).to have_content "Winter is coming"
      end

      it "can delete own comment" do
        click_on "Delete Comment"
        wait_for_ajax_to_finish
        expect(page).to_not have_content ned_comment.content
      end
    end
  end
end
