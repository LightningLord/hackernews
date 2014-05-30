require 'spec_helper'
describe CommentsController do
  let(:my_post){FactoryGirl.create(:post)}
  let(:ned_stark){FactoryGirl.create(:user)}
  let(:login){request.session[:user_id] = ned_stark.id}
  let(:my_comment){FactoryGirl.create(:comment, :post => my_post, :user => ned_stark)}
  before(:each){login}

  context '#create' do
    it "creates a comment" do
      expect { post :create, :post_id => my_post.id, :comment =>
        FactoryGirl.attributes_for(:comment) }.to change {Comment.count}.by(1)
    end

    it "sends back a partial" do
      post(:create, :post_id => my_post.id,
        :comment => FactoryGirl.attributes_for(:comment))
      expect(response).to render_template(:partial => '_comment')
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
    let(:update_post){patch :update, :post_id => my_post.id, :id => my_comment.id,
        :comment => {:content => "Ours is the fury"} }
    context 'valid user' do
      before(:each){update_post}
      it "updates a comment" do
        expect(my_comment.reload.content).to eq "Ours is the fury"
      end

      it "renders comment partial for valid user" do
        expect(response).to render_template(:partial => '_comment')
      end
    end
    context 'invalid user' do
      before(:each) do
        request.session[:user_id] = FactoryGirl.create(:user).id
        update_post
      end
      it "renders not_owner partial" do
        expect(response).to render_template(:partial => '_not_owner')
      end

      it "does not update the comment" do
        expect(my_comment.content).to eq my_comment.reload.content
      end
    end
  end

  context '#destroy' do
    let!(:to_delete){FactoryGirl.create(:comment, :post => my_post, :user => ned_stark)}
    it "deletes a comment" do
      expect{ delete :destroy, :post_id => my_post.id, :id => to_delete.id }.to change {
        Comment.count}.by(-1)
    end

  end


end
