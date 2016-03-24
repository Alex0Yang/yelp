require 'spec_helper'

feature "business and review" do
  scenario "add a business and review it" do
    alice = Fabricate(:user)
    food = Fabricate(:category, name: "Food")
    sign_in alice
    find("a[href='/businesses/new']").click
    fill_in "business_name", with: "Hey, Cookie!"
    select(food.name, from: "Type")
    fill_in "Description", with: "Delivering delicious, homemade treats with a handwritten note, warm hug and big smile throughout San Francisco. (Minimum order for delivery 3 dozen for $45.)"
    fill_in "Address", with: "New York"
    fill_in "Phone", with: "999-100"
    fill_in "Website", with: "www.google.com"
    click_button "Add business"
    expect(page).to have_content("Hey, Cookie!")
    find_link("Hey, Cookie!").click
    expect(page).to have_content("google")
    select("4 Stars", from: "review_rate")
    fill_in "review_content", with: "new review."
    click_button "submit"
    expect(page).to have_content("new review")
  end
end
