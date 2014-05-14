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

  describe "new posts" do
    context 'logged in user' do
    let(:ned_stark){FactoryGirl.create(:user)}
      it "can access the new post form" do
        visit new_session_path
        fill_in "name", :with => ned_stark.name
        fill_in "password", :with => ned_stark.password
        click_button "Log in"
        click_on "New Post"
        expect(page).to have_content "Title"
        expect(page).to have_content "Content"
      end
    end
  end
end
