require 'spec_helper'

describe UsersController do
  describe "GET new" do
    before { get :new }

    it "set @user" do
      expect(assigns(:user)).to be_kind_of(User)
    end

    it_behaves_like "render_page", "new"
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

      it_behaves_like "redirect_to", "/"

      it_behaves_like "show_flash_message", :success

      it "sign in the user" do
        expect(session[:user_id]).to eq(User.last.id)
      end
    end

    context "invalid input" do
      before do
        post :create, user: { full_name: "alice" }
      end
      it "cannot sign up" do
        expect(User.count).to eq(0)
      end

      it_behaves_like "show_flash_message", :danger

      it_behaves_like "render_page", "new"

      it "set @user" do
        expect(assigns(:user)).to be_kind_of(User)
      end
    end
  end
  describe "GET show" do
    it "set @user" do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      get :show, id: alice.id
      expect(assigns(:user)).to eq(alice)
    end
  end
end
