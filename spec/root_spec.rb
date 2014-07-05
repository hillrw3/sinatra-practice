require 'spec_helper'

feature "Root" do

  scenario "should have a button that says registration" do
    visit "/"
    expect(page).to have_content("Register")
  end


end