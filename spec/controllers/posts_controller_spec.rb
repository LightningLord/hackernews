require 'spec_helper'
describe PostsController do
  let(:ned_stark){FactoryGirl.create(:user)}
  let(:new_post){FactoryGirl.create(:post, :user => ned_stark)}
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

    it "creates a post with valid attributes" do
      expect {post :create, :post => FactoryGirl.attributes_for(:post)}.to change {Post.count}.by(1)
    end

    it "redirects to root path with invalid attributes" do
      post :create, :post => {}
      expect(response).to redirect_to root_path
    end
  end

  context '#destroy' do
    before(:each){request.session[:user_id] = ned_stark.id}
    let!(:to_delete){FactoryGirl.create(:post, :user => ned_stark)}
    it "deletes a post" do
      expect {delete :destroy, :id => to_delete.id}.to change {Post.count}.by(-1)
    end

    it "redirects to root path" do
      delete :destroy, :id => to_delete.id
      expect(response).to redirect_to root_path
    end
  end

  context '#edit' do
    before(:each) do
      request.session[:user_id] = ned_stark.id
      get :edit, :id => new_post.id
    end
    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @post to the correct post" do
      expect(assigns(:post)).to eq new_post
    end


  end
end
