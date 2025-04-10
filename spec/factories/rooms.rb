FactoryBot.define do
  factory :room do
    invite_code { SecureRandom.hex(10) }
    venue { venue }
    host_id { attendee }
  end
end
