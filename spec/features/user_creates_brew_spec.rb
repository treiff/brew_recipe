require 'rails_helper'

feature "User creates brew" do
  before(:each) do
    login_user
  end

  scenario "with valid input" do
    expect(page).to have_content("Browse Brews")
  end
end
