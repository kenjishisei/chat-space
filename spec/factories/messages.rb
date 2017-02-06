FactoryGirl.define do

  factory :message do
    body Faker::Lorem.sentence
  end
end
