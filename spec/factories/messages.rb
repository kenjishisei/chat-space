FactoryGirl.define do

  factory :message do
    body Faker::Lorem.sentence
    user_id Faker::Number.between(1,100)
    group_id Faker::Number.between(1,100)
  end
end
