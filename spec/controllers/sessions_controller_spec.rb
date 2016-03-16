require 'spec_helper'

describe SessionsController do
  context "GET new" do
    it "render new page for unauthenticated user" do
      get :new
      expect(response).to render_template "new"
    end
    it "redirect to user's profile page"
  end

  context "POST create" do
    let(:alice) { Fabricate(:user, password: "password") }
    context "valid email && password" do
      before do
        post :create, user: { email: alice.email, password: alice.password }
      end

      it "set the notice" do
        expect(flash[:success]).not_to be_empty
      end
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
      it "show a error message" do
        expect(flash[:danger]).not_to be_empty
      end

      it "user cannot sign in" do
        expect(session[:user_id]).to be nil
      end

      it "render the sign in page" do
        expect(response).to render_template "new"
      end
    end

  end
  context "DELETE destroy" do
    it "redirects to sign in page" do
      session[:user_id] = Fabricate(:user)
      delete :destroy
      expect(response).to redirect_to sign_in_path
    end

    it "sign out the user" do
      session[:user_id] = Fabricate(:user)
      delete :destroy
      expect(session[:user_id]).to eq(nil)
    end
    it "show the notice"
  end
end
