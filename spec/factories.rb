FactoryGirl.define do
  factory :phrase1 do
    text Faker::Lorem.sentence
  end
  factory :phrase do
    text Faker::Lorem.sentence
  end
end
