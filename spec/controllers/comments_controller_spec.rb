require 'spec_helper'
describe CommentsController do
  let(:my_post){FactoryGirl.create(:post)}
  let(:ned_stark){FactoryGirl.create(:user)}
  let(:login){request.session[:user_id] = ned_stark.id}
  let(:my_comment){FactoryGirl.create(:comment, :post => my_post)}
  before(:each){login}

  context '#create' do
    it "creates a comment" do
      expect { post :create, :post_id => my_post.id, :comment =>
        FactoryGirl.attributes_for(:comment) }.to change {Comment.count}.by(1)
    end

    it "redirects" do
      post(:create, :post_id => my_post.id,
        :comment => FactoryGirl.attributes_for(:comment))
      expect(response).to be_redirect
    end
  end

  context '#edit' do
    before(:each) { get :edit, :post_id => my_post.id, :id => my_comment.id}
    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @comment to the right comment" do
      expect(assigns(:comment)).to eq my_comment
    end

  end

  context '#update' do
    before(:each){patch :update, :post_id => my_post.id, :id => my_comment.id,
      :comment => {:content => "Ours is the fury"} }
    it "updates a comment" do
      expect(my_comment.reload.content).to eq "Ours is the fury"
    end

    it "redirects to post show page" do
      expect(response).to redirect_to post_path(my_post)
    end
  end

  context '#destroy' do
    it "deletes a comment" do
      expect{ delete :destroy, :post_id => my_post.id, :id => my_comment.id }.to change {
        Comment.count}.by(-1)
    end

    it "redirects to post show page" do
      delete :destroy, :post_id => my_post.id, :id => my_comment.id
      expect(response).to redirect_to post_path(my_comment.post)
    end
  end


end
