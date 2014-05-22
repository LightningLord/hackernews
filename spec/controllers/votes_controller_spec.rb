require 'spec_helper'
describe VotesController do

  context '#create' do
    let(:ned_stark){FactoryGirl.create(:user)}
    let(:my_post){FactoryGirl.create(:post)}
    let(:create) do
      post :create, vote_data: {
        votable_id: my_post.id, votable_type: "Post", value: +1}
    end
    before(:each) do
      request.session[:user_id] = ned_stark.id
    end
    it "creates a vote" do
      expect { create }.to change {Vote.count}.by(1)
    end
    it "updates votecount" do
      expect {create }.to change {my_post.reload.vote_count}.by(1)
    end

    it "renders something"
  end
end


