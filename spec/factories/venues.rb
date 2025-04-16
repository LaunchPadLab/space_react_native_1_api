FactoryBot.define do
  factory :venue do
    name { Faker::Restaurant.name }
    menu_link { 'http://google.com' }
    cost { 100 }
    rating { 5 }
    category { Venue.categories.values.sample }
  end
end
