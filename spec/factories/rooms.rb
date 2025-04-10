FactoryBot.define do
  factory :room do
    invite_code { SecureRandom.hex(10) }
    association :venue
    host_id { attendee }
  end
end
