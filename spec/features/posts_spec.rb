describe "posts", :js => false do
  describe "posts index page" do
    let!(:new_post){FactoryGirl.create(:post)}
    it "renders a list of posts" do
      visit root_path
      expect(page).to have_link :new_post.title
      expect(page).to have_content :new_post.user.name
    end
  end
end
