describe "posts", :js => false do
  describe "posts index page" do
    let!(:new_post){FactoryGirl.create(:post)}
    before(:each){visit root_path}
    it "renders a list of posts" do
      expect(page).to have_link new_post.title
    end

    it "shows the author's name for each post" do
      expect(page).to have_content new_post.user.name
    end

    it "links to a post's show page" do
      click_on new_post.title
      expect(page).to have_content new_post.content
    end
  end
end
