require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "set @user" do
      get :new
      expect(assigns(:user)).to be_kind_of(User)
    end

    it "render the new page" do
      get :new
      expect(response).to render_template "new"
    end
  end
  describe "POST create" do
    context "valid input" do
      before do
        alice = Fabricate.attributes_for(:user)
        post :create, user: alice
      end
      it "create new user" do
        expect(User.count).to eq(1)
      end

      it "redirect to root_path" do
        expect(response).to redirect_to root_path
      end

      it "have a success message" do
        expect(flash[:success]).not_to be_empty
      end
    end

    context "invalid input" do
      before do
        post :create, user: { full_name: "alice" }
      end
      it "cannot sign up" do
        expect(User.count).to eq(0)
      end

      it "have a error message" do
        expect(flash[:danger]).not_to be_empty
      end

      it "render new page" do
        expect(response).to render_template "new"
      end

      it "set @user" do
        expect(assigns(:user)).to be_kind_of(User)
      end
    end
  end
end
