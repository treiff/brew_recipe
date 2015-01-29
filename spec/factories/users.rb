FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.username { Faker::Internet.user_name }
  end
end
