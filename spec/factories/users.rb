FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.username { Faker::Internet.user_name }
    f.password "password"
    f.password_confirmation "password"
  end

  factory :valid_user, class: User do |f|
    f.name "Trevor"
    f.email "trevor@example.com"
    f.password "myPassword1"
    f.password_confirmation "myPassword1"
  end

end
