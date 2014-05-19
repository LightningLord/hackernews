require 'spec_helper'
describe CommentsController do
  let(:my_post){FactoryGirl.create(:post)}
  let(:ned_stark){FactoryGirl.create(:user)}
  let(:login){request.session[:user_id] = ned_stark.id}

  context '#create' do
    before(:each){login}
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
    let(:my_comment){FactoryGirl.create(:comment, :post => my_post)}
    before(:each){get :edit, :post_id => my_post.id, :id => my_comment.id}
    it "is successful" do
      expect(response).to be_successful
    end

    it "assigns @comment to the right comment" do
      expect(assigns(:comment)).to eq my_comment
    end

  end

end
