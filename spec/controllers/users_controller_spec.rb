require 'spec_helper'
describe UsersController do
  describe "new" do
    before(:each){get :new}
    it "is a success" do
      expect(response).to be_successful
    end

    it "assigns @user to a new user" do
      expect(assigns(:user)).to be_a_new User
    end
  end

  describe "create" do
    context "valid params" do
      it "creates a new user" do
        expect {post :create, :user => FactoryGirl.attributes_for(:user)}.
        to change {User.count}.by(1)
      end

      it "stores user_id in session"
      it "redirects to user profile"
    end
    context "invalid params" do
    end
      it "redirects to root "
  end

  describe "show" do
    it "assigns @user to the logged in user"
  end
end
