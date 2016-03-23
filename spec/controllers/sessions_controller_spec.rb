require 'spec_helper'

describe SessionsController do
  context "GET new" do
    context "unauthenticated user" do
      before do
        clear_session
        get :new
      end
      it_behaves_like "render_page", "new"
    end

    context "authenticated user" do
      it "redirect to root path" do
        set_current_user
        get :new
        expect(response).to redirect_to root_path
      end
    end
  end

  context "POST create" do
    let(:alice) { Fabricate(:user, password: "password") }

    context "valid email && password" do
      before do
        post :create, user: { email: alice.email, password: alice.password }
      end

      it_behaves_like "show_flash_message", :success

      it "user can sign in" do
        expect(session[:user_id]).to eq(alice.id)
      end

      it "redirect to homepage" do
        expect(response).to redirect_to root_path
      end
    end

    context "invalid email or password" do
      before do
        post :create, user: { email: alice.email, password: alice.password + "1" }
      end

      it_behaves_like "show_flash_message", :danger

      it "user cannot sign in" do
        expect(session[:user_id]).to be nil
      end

      it_behaves_like "render_page", "new"
    end

  end
  context "DELETE destroy" do
    before do
      set_current_user
      delete :destroy
    end
    it "redirects to sign in page" do
      expect(response).to redirect_to sign_in_path
    end

    it "sign out the user" do
      expect(session[:user_id]).to eq(nil)
    end

    it_behaves_like "show_flash_message", :info
  end
end
