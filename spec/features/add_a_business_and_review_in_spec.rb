require 'spec_helper'

feature "business and review" do
  scenario "add a business and review it" do
    alice = Fabricate(:user)
    food = Fabricate(:category, name: "Food")

    sign_in alice

    new_business = Fabricate.attributes_for(:business, category: food)
    add_business(new_business)
    expect_page_has_business(new_business)

    new_review = Fabricate.attributes_for(:review)
    add_review_for_business(new_review, new_business)

    expect_business_has_review(new_review)
  end

  def expect_business_has_review(review_hash)
    expect(page).to have_content(review_hash[:name])
  end

  def add_review_for_business(new_review_hash, new_business_hash)
    find_link(new_business_hash[:name]).click
    select("4 Stars", from: "review_rate")
    fill_in "review_content", with: new_review_hash[:content]
    click_button "submit"
  end

  def expect_page_has_business(new_business_hash)
    expect(page).to have_content(new_business_hash[:name])
  end

  def add_business(new_business_hash)
    find("a[href='/businesses/new']").click
    fill_in "business_name", with: new_business_hash[:name]
    select(Category.find(new_business_hash[:category_id]).name, from: "Type")
    fill_in "Description", with: new_business_hash[:description]
    fill_in "Address", with: new_business_hash[:address]
    fill_in "Phone", with: new_business_hash[:phone]
    fill_in "Website", with: new_business_hash[:website]
    click_button "Add business"
  end
end
