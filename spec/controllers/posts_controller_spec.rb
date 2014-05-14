require 'spec_helper'
describe PostsController do
  let(:ned_stark){FactoryGirl.create(:user)}
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

  context '#new' do
    before(:each) do
      request.session[:user_id] = ned_stark.id
      get :new
    end
    it "is successful" do
      expect(response).to be_successful
    end
    it "assigns @post to a new post" do
      expect(assigns(:post)).to be_a_new Post
    end
  end

  context '#create' do
    before(:each){request.session[:user_id] = ned_stark.id}
    it "redirects after creating a post" do
      post :create, :post => {:title => "Winter", :content => "Is Coming"}
      expect(response).to be_redirect
    end

    it "creates a post" do
      expect {post :create, :post => FactoryGirl.attributes_for(:post)}.to change {Post.count}.by(1)
    end
  end
end
