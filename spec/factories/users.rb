FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@example.com"
    end

    sequence :name do |n|
      "user#{n}"
    end

    password { 'password' }

    confirmed_at { 1.day.ago }
  end
end
