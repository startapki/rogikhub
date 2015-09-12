FactoryGirl.define do
  factory :client do
    association :organization
    association :user
  end
end
