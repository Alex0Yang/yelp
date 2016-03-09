require 'spec_helper'

describe BusinessesController do
  describe "GET index" do
    it "sets @businesses" do
      business_1 = Fabricate(:business)
      business_2 = Fabricate(:business)
      get :index
      expect(assigns(:businesses)).to eq([business_1, business_2])
    end

    it "render the index page" do
      Fabricate(:business)
      Fabricate(:business)
      get :index
      expect(response).to render_template "businesses/index"
    end
  end

  describe "GET new" do
    it "set @business" do
      get :new
      expect(assigns(:business)).to be_kind_of(Business)
    end

    it "render the 'businesses/new'" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    context "input is valid" do
      it "redrect to business lists" do
        business_hash = Fabricate.attributes_for(:business)
        post :create, business: business_hash
        expect(response).to redirect_to businesses_path
      end

      it "display a successful message" do
        business_hash = Fabricate.attributes_for(:business)
        post :create, business: business_hash
        expect(flash[:success]).not_to be_blank
      end

      it "create a new business" do
        business_hash = Fabricate.attributes_for(:business)
        post :create, business: business_hash
        expect(Business.count).to eq(1)
      end
    end

    context "input is invalid" do
      it "cannot create a new business" do
        post :create, business: { name: "some business"}
        expect(response).to render_template "new"
      end

      it "display a unsuccessful message" do
        post :create, business: { name: "some business"}
        expect(flash[:warning]).not_to be_blank
      end

      it "render new page" do
        post :create, business: { name: "some business"}
        expect(response).to render_template "new"
      end
    end
  end
end
