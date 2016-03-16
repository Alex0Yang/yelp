require 'spec_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:business) }

  describe "#business_name" do
    it "equal to business's name" do
      food = Fabricate(:business, name: "food")
      review = Fabricate(:review, business: food)
      expect(review.business_name).to eq("food")
    end
  end
end
