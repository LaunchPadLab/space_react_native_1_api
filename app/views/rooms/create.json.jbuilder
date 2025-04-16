json.room do
  json.id @room.id
  json.name @room.name
  json.invite_code @room.invite_code
  json.venue_ids @room.venues.map(&:id)
  json.status @room.status
end
json.host do
  json.id @host.id
end
