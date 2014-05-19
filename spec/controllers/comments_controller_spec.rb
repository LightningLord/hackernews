require 'spec_helper'
describe CommentsController do
  context '#create' do
    let(:my_post){FactoryGirl.create(:post)}
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
end
