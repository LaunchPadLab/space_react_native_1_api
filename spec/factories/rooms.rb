FactoryBot.define do
  factory :room do
    name { Faker::Book.title }
    invite_code { SecureRandom.hex(3) }
    venues { [venue] }
    host_id { attendee }
    status { :open }
  end
end
