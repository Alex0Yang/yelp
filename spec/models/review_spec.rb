require 'spec_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:business) }
  it { should validate_presence_of(:content) }
  it { should validate_numericality_of(:rate).only_integer }
  it { should validate_uniqueness_of(:user_id).scoped_to(:business_id) }

  describe "#business_name" do
    it "equal to business's name" do
      food = Fabricate(:business, name: "food")
      review = Fabricate(:review, business: food)
      expect(review.business_name).to eq("food")
    end
  end

  describe "#user_full_name" do
    it "it returns the full_name of user" do
      alice = Fabricate(:user, full_name:"alice")
      review = Fabricate(:review, user: alice)
      expect(review.user_full_name).to eq("alice")
    end
  end
end
