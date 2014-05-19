require 'spec_helper'
describe CommentsController do
    let(:my_post){FactoryGirl.create(:post)}
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
    let(:my_comment){FactoryGirl.create(:comment, :post => my_post)}
    it "is successful" do
      get :edit, :post_id => my_post.id, :id => my_comment.id
      expect(response).to be_successful
    end

    it "edits a comment"
  end

end
