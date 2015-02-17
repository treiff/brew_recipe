require 'rails_helper'

RSpec.describe 'static_pages/home.html.erb', type: :view do
  it "has the title 'Brew Blog | Home'" do
    visit('/')
    expect(page).to have_title "Brew Blog | Home"
  end
end
