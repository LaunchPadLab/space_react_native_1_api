FactoryBot.define do
  factory :venue do
    name { Faker::Restaurant.name }
    menu_link { 'http://google.com' }
    instagram_link { 'http://google.com' }
    cost { (1..5).to_a.sample }
    rating { (3..5).sample }
    category { Venue.categories.values.sample }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end
end
