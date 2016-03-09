require 'spec_helper'

describe Business do
    it "#category name" do
      food = Fabricate(:category, name: "food")
      business = Fabricate(:business, category: food)
      expect(business.category_name).to eq("food")
    end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }
end
