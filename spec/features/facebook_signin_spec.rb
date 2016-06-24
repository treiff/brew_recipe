require 'rails_helper'

feature "omniauth user" do
  before(:each) do
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  scenario "with valid facebook account signs in" do
    visit root_path
    login_with_oauth
    click_link "Log in"
    click_link "login with facebook"

    expect(page).to have_content("Test User")
  end

  # Finish this test!
  scenario "with valid facebook account signs out"
end
