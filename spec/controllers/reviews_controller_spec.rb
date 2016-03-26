require 'spec_helper'

describe ReviewsController do

  describe "GET index" do
    it "render the index page" do
      get :index
      expect(response).to render_template :index
    end

    it "set @reviews" do
      review_1 = Fabricate(:review)
      review_2 = Fabricate(:review)
      get :index
      expect(assigns(:reviews)).to eq([review_1, review_2])
    end
  end

  describe "POST create" do

    context "unauthenticated user" do
      it "redirects to sign in page" do
        post :create
        expect(response).to redirect_to sign_in_path
      end

      it "no business's review added" do
        post :create
        expect(Review.count).to eq(0)
      end
    end

    context "authenticated user" do
      let(:alice) { Fabricate(:user) }
      let(:business) { Fabricate(:business) }

      before { set_current_user(alice) }

      context "valid input" do
        before do
          post :create, review: Fabricate.attributes_for(:review, user: alice, business: business)
        end

        it "redirect to business show page" do
          expect(response).to redirect_to business
        end

        it_behaves_like "show_flash_message", :info

        it "create a review" do
          expect(Review.count).to eq(1)
        end

        it "create a review associated with the business" do
          expect(Review.last.business).to eq(business)
        end

        it "create a review associated with the signed in user" do
          expect(alice.reviews.count).to eq(1)
        end
      end

      context "invalid input" do
        before do
          post :create, review: Fabricate.attributes_for(:review, business: business, content:"")
        end

        it "does not add a review" do
          expect(Review.count).to eq(0)
        end

        it "redirect to the business/show page" do
          expect(response).to redirect_to business
        end

        it "set @business" do
          expect(assigns(:business)).to eq(business)
        end
      end
    end
  end
end
