require 'spec_helper'

describe Post do
  it {should have_many :comments}
  it {should belong_to :user}

  it {should validate_presence_of :title}
  it {should validate_presence_of :content}
  it {should validate_presence_of :user}

  it {should have_many :votes}

  context "updateVoteCount" do
    let(:my_post){FactoryGirl.create(:post)}
    it "should change the vote properly" do
      expect{my_post.update_vote_count(1)}.to change{my_post.reload.vote_count}.by(1)
    end
  end
end
