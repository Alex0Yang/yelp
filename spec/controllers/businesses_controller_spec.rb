require 'spec_helper'

describe BusinessesController do
  describe "GET index" do
    let(:business_1) { Fabricate(:business) }
    let(:business_2) { Fabricate(:business) }

    before do
      get :index
    end
    it "sets @businesses" do
      expect(assigns(:businesses)).to eq([business_1, business_2])
    end

    it_behaves_like "render_page", "index"
  end

  describe "GET new" do
    before { get :new }

    it "set @business" do
      expect(assigns(:business)).to be_kind_of(Business)
    end

    it_behaves_like "render_page", "new"
  end

  describe "POST create" do
    context "input is valid" do
      let(:business_hash) { Fabricate.attributes_for(:business) }
      before do
        post :create, business: business_hash
      end

      it_behaves_like "show_flash_message", :success

      it_behaves_like "redirect_to", "/businesses"

      it "create a new business" do
        expect(Business.count).to eq(1)
      end
    end

    context "input is invalid" do
      before do
        post :create, business: { name: "some business"}
      end

      it "cannot create a new business" do
        expect(Business.count).to eq(0)
      end

      it_behaves_like "show_flash_message", :warning

      it_behaves_like "render_page", "new"
    end
  end

  describe "GET show" do
    let(:food) { Fabricate(:business, name: "food") }
    before { get :show, id: food.id }

    it_behaves_like "render_page", "show"

    it "set @business" do
      expect(assigns(:business).name).to eq("food")
    end
  end
end
