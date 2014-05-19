describe "comments", :js => false do
  describe "on the post show page" do
    let(:ned_stark){FactoryGirl.create(:user)}
    let(:tyrion){FactoryGirl.create(:user)}
    let(:new_post){FactoryGirl.create(:post, :user => ned_stark)}
    let(:new_comment){FactoryGirl.create(:comment, :user=> tyrion, :post=> new_post)}
    context "any user" do
      it "can see all of the comments for a post" do
        visit post_path(new_post)
        expect(page).to have_content(new_comment.content)
      end
    end
    context "logged in user" do

      it "can comment on a post"
      it "can edit own comment"
      it "can delete own comment"
    end
  end
end
