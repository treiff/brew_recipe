require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "is invalid with out a email" do
    expect(build(:user, email: "  ")).to_not be_valid
  end

  it "is invalid with too long of a name" do
    username = "a" * 51
    expect(build(:user, username: username)).to_not be_valid
  end

  it "is invalid with too long of a email" do
    email = "a" * 244 + "@example.com"
    expect(build(:user, email: email)).to_not be_valid
  end

  it "is valid with valid email address" do
    valid_email = %w(blah@testing.com BLAH@you.COM S_GUY-5@bar.foo.org joe.shmoe@bar.nl kim+greg@whale.jp)
    valid_email.each do |email|
      expect(build(:user, email: email)).to be_valid
    end
  end

  it "is not valid with invalid email address" do
    invalid_email = %w(blah@testing,com S_GUY_bro.org joe.shmoe@bar.foo@bar.com kim@whale+fish.com)
    invalid_email.each do |email|
      expect(build(:user, email: email)).to_not be_valid
    end
  end

  describe "is not valid with duplicate uppercase email address" do
    let(:user) { create(:user) }
    subject { build(:user, email: user.email.upcase) }
    it { should_not be_valid }
  end

  describe "is not valid with duplicate usernames" do
    let(:user) { create(:user) }
    subject { build(:user, username: user.username) }
    it { should_not be_valid }
  end

  describe "is not valid with duplicate upercase usernames" do
    let(:user) { create(:user) }
    subject { build(:user, username: user.username.upcase) }
    it { should_not be_valid }
  end

  it "is invalid with too short of a password" do
    pass = "a" * 5
    expect(build(:user, password: pass, password_confirmation: pass)).to_not be_valid
  end
end
