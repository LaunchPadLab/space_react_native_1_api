FactoryBot.define do
  factory :venue do
    name { 'Venue Name' }
    menu_link { 'http://menu.page.com' }
    cost 100
    rating 5
    category_id 1
  end
end
