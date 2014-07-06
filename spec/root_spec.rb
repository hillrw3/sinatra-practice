require 'spec_helper'

feature "Root" do

  scenario "should have a button that says registration" do
    visit "/"
    expect(page).to have_content("Register")
  end

  scenario "have username field" do
    visit "/"
    click_on "Register"
    expect(page).to have_content("Username:")
  end


end