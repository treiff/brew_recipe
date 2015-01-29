require 'rails_helper'

describe "Create new user" do
  context "Go to home page" do
    it "opens homepage" do
      visit(root_path)
    end
  end
end
