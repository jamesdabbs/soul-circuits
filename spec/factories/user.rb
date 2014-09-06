FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "awfulPass"
    password_confirmation "awfulPass"
    role :fan
  end

  factory :dj, class: "User" do
    sequence(:email) { |n| "dj#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role :dj
  end

  factory :fan, class: "User" do
    sequence(:email) { |n| "fan#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role :fan
  end
end
