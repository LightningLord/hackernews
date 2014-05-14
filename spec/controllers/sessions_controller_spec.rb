describe SessionsController do
  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

  context "#create" do
    let(:ned_stark) {FactoryGirl.create(:user)}
    before(:each) { post :create, name: ned_stark.name, password: ned_stark.password }
    it "sets session[:user_id] for a valid user" do
      expect(session[:user_id]).to eq ned_stark.id
    end
    it "redirects to root_path" do
      expect(response).to redirect_to root_path
    end
  end
end
