# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

raise 'SEEDING NOT ALLOWED IN PRODUCTION' if Rails.env.production?

100.times do
FactoryBot::create(:venue)
end

3.times do
  FactoryBot::create(:room,
                     venues: [Venue.first, Venue.second, Venue.third],
                     host_id: nil)
end

Room.all.each do |room|
  host = FactoryBot::create(:attendee, room_id: room.id)
  room.update(host_id: host.id)
end

# Seeds::UserSeeder.new.run
