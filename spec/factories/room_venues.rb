FactoryBot.define do
  factory :room_venue do
    association :room
    association :venue
  end
end
