FactoryGirl.define do

  factory :message do
    body       "test"
    image      "test.jpg"
    user_id    "1"
    group_id   "1"
  end
end
