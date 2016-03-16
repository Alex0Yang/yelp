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
end
