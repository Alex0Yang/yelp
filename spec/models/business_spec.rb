require 'spec_helper'

describe Business do

  it { should belong_to(:category)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }
  it { should have_many(:reviews) }

  describe "category_name" do
    it "return category's name" do
      food = Fabricate(:category, name: "food")
      business = Fabricate(:business, category: food)
      expect(business.category_name).to eq("food")
    end
  end

  describe "#has_review" do
    let(:business) { Fabricate(:business) }

    it "return true if the count of review greater than zero" do
      Fabricate(:review, business: business)
      expect(business.has_review?).to be true
    end

    it "return false if the count of review equal to zero" do
      expect(business.has_review?).to be false
    end
  end

  describe "#last_review_user_name" do
    it "return the name of last review's user if has_review" do
      alice = Fabricate(:user, full_name: "alice")
      business = Fabricate(:business)
      Fabricate(:review, business: business, user: alice)
      expect(business.last_review_user_name).to eq("alice")
    end
  end

  describe "#last_review_user" do
    it "return the user of last review" do
      alice = Fabricate(:user, full_name: "alice")
      business = Fabricate(:business)
      Fabricate(:review, business: business, user: alice)
      expect(business.last_review_user).to eq(alice)
    end
  end

  describe "#last_review_time" do
    it "return the create time of last review" do
      alice = Fabricate(:user, full_name: "alice")
      business = Fabricate(:business)
      review = Fabricate(:review, business: business, user: alice)
      expect(business.last_review_time).to eq(review.created_at)
    end
  end
end
