require 'rails_helper'

feature "User votes on a beer" do
  before(:each) do
    visit(beers_path)
    click_link 'chev-up'
  end

  scenario 'if logged in'
  scenario 'if not logged in'
end
