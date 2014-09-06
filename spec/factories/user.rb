FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "awfulPass"
    password_confirmation "awfulPass"
  end

  factory :dj, class: "User" do
    sequence(:email) { |n| "dj#{n}@example.com" }
    password "password"
    password_confirmation "password"
    role :dj
  end
end
