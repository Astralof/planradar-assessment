FactoryBot.define do
  factory :ticket do
    association :user

    title { "test" }
    description { "Clean the floor." }
    due_date { Date.tomorrow }
  end
end