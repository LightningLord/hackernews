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
      let(:create_user){post :create, :user => FactoryGirl.attributes_for(:user) }
      it "creates a new user" do
        expect {create_user}.to change {User.count}.by(1)
      end

      it "stores user_id in session" do
        create_user
        expect(session[:user_id]).to_not be_nil
      end
      it "redirects to user profile" do
        create_user
        expect(response).to be_redirect
      end
    end
    context "invalid params" do
      it "redirects to root " do
        post :create, :user => {name: nil, password: "winter"}
        expect(response).to redirect_to new_user_path
      end
    end
  end

  describe "show" do
    let(:new_user){FactoryGirl.create(:user)}
    before(:each){get :show, :id => new_user.id}
    it "assigns @user to the logged in user" do
      expect(assigns(:user)).to eq new_user
    end

    it "is successful" do
      expect(response).to be_successful
    end
  end
end
