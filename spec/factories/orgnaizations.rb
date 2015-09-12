FactoryGirl.define do
  factory :organization do
    sequence :name do |n|
      "name#{n}"
    end
    association :hub
  end
end
