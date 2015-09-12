FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password { 'password' }
    confirmed_at { 1.day.ago }
  end
end
