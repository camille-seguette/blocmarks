FactoryGirl.define do
  factory :topic do
    title { Faker::Hipster.words(5) }
    user
  end
end
