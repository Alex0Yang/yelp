require 'spec_helper'

feature "user sign in" do
  let(:alice) { Fabricate(:user) }

  scenario "with wrong password" do
    visit sign_in_path
    fill_in "user[email]", with: alice.email
    fill_in "user[password]", with: alice.password + "pas"
    click_button "Sign in"
    expect(page).to have_text("Sign in to your account")
  end

  scenario "with valid password and email" do
    visit sign_in_path
    fill_in "user[email]", with: alice.email
    fill_in "Password", with: alice.password
    click_button "Sign in"
    expect(page).to have_text("Business Listing")
  end
end
