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

  scenario "login to the website" do
    visit "/"
    UserDatabase.new.insert({:username => "rob", :password => "pass"})
    fill_in 'Username:', with: "rob"
    fill_in 'Password:', with: "pass"
    click_on "login"
    expect(page).to have_content("You're logged in!")
  end


end