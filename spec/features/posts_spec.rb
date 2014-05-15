describe "posts", :js => false do
  let(:ned_stark){FactoryGirl.create(:user)}
  let(:stub_current_user){PostsController.any_instance.stub(:current_user).and_return(ned_stark)}
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
    before(:each) do
      stub_current_user
      visit new_post_path
    end
      it "can access the new post form" do
        expect(page).to have_content "Title"
        expect(page).to have_content "Content"
      end

      it "can create a post" do
        fill_in "post[title]", :with => "Winter"
        fill_in "post[content]", :with => "Is Coming"
        click_on "Create Post"
        expect(page).to have_content("Winter")
        expect(page).to have_content("Is Coming")
        expect(page).to have_content(ned_stark.name)
      end
    end
  end

  describe "delete a post" do
    context 'logged in user' do
      let(:my_post){FactoryGirl.create(:post)}
      it "can delete a post" do
        stub_current_user
        visit post_path(my_post)
        click_on "Delete Post"
        expect(page).to_not have_content my_post.title
      end
    end
  end



end
