FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    email { "#{username}@example.com" }
    password "awfulPass"
    password_confirmation "awfulPass"
    role "dj"
  end

  factory :dj, class: "User" do
    sequence(:username) { |n| "dj#{n}" }
    email { "#{username}@example.com" }
    password "password"
    password_confirmation "password"
    role "dj"
  end

  factory :fan, class: "User" do
    sequence(:username) { |n| "fan#{n}" }
    email { "#{username}@example.com" }
    password "password"
    password_confirmation "password"
    role "fan"
  end
end
