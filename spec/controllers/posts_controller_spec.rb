require 'spec_helper'
describe PostsController do
  context '#index' do
    before(:each) {get :index}
    it "assigns @posts to all posts" do
      expect(assigns(:posts)).to eq Post.all
    end

    it "is successful" do
      expect(response).to be_successful
    end
  end

  context '#show' do
    let(:new_post) {FactoryGirl.create(:post)}
    before(:each) {get :show, :id=> new_post.id}

    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @post to the correct post" do
      expect(assigns(:post)).to eq new_post
    end
  end
end
