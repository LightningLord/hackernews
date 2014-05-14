require 'spec_helper'
describe User do
  it {should have_many :posts}
  it {should have_many :comments}

  context "create" do
    it "sets user's name properly" do
      params = {name: "Ned Stark", password: "winter"}
      user = User.create(params)
      user.save
      expect(user.name).to eq "Ned Stark"
    end

  end
end
