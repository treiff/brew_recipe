require 'rails_helper'

feature "User signs up" do
  before(:each) do
    visit(root_path)
    click_link 'Sign up'
  end

  scenario "with valid credentials" do
    valid_sign_up_credentials
    click_button 'Sign up'

    expect(page).to have_content("Logged in as:")
    expect(page).to have_css(".alert-success")
  end

  scenario "with invalid email" do
    user = (build(:valid_user, email: "Foo#example.com"))
    click_button 'Sign up'

    expect(page).not_to have_content("Logged in as:")
    expect(page).to have_css(".alert-warning")
  end

  scenario "with incorrent password confirmation" do
    user = (build(:valid_user, password: "notthesame"))
    click_button 'Sign up'

    expect(page).not_to have_content("Logged in as:")
    expect(page).to have_css(".alert-warning")
  end
end
