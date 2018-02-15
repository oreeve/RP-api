FactoryBot.define do
  factory :property do
    neighborhood { Faker::LordOfTheRings.location }
    description { Faker::HitchhikersGuideToTheGalaxy.quote }
    beds { Faker::Number.digit }
    baths { Faker::Number.digit }
    home_size { Faker::Number.number(4) }
    lot_size { Faker::Number.number(4) }
    type_of { Faker::WorldOfWarcraft.hero }
    status { Faker::RickAndMorty.location }
    address  { {
     street_address: Faker::Address.street_address,
     city: Faker::Address.city,
     state: Faker::Address.state,
     zip: Faker::Address.zip
    } }
  end
end
