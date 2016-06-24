require 'rails_helper'

feature 'User edits profile' do
  before(:each) do
    @user = create(:valid_user)
    visit login_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Sign in"
  end

  scenario "with valid credentials" do
    visit(edit_user_path(@user.id))
    fill_in "Username", with: "beerBelly"
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    click_button "Save changes"

    expect(page).to have_css(".alert-success")
    expect(User.find(@user.id).username).to eql("beerBelly")
  end

  scenario "with invalid credentials" do
    visit(edit_user_path(@user.id))
    fill_in "Email", with: "bogus.#com"
    fill_in "Password", with: @user.password
    fill_in "Password confirmation", with: @user.password
    click_button "Save changes"

    expect(page).to have_css(".alert-danger")
    expect(User.find(@user.id).email).to eql @user.email
  end
end
