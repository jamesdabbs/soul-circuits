FactoryGirl.define do
  factory :playlist do
    sequence(:title) { |n| "playlist#{n}" }
    audio_url "http://www.google.com"
    user { create :dj }
  end
end
