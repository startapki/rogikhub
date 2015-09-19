FactoryGirl.define do
  factory :hub do
    sequence :name do |n|
      "name#{n}"
    end
    path { name }
  end
end
