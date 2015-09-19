FactoryGirl.define do
  factory :vendor do
    association :hub
    association :user
  end
end
