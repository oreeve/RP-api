FactoryBot.define do
  factory :image do
    title { Faker::GameOfThrones.character }
    url { Faker::Internet.url }
    description { Faker::Overwatch.quote }
    property nil
  end
end
