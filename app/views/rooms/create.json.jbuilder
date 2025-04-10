json.room do
  json.name @room.name
  json.invite_code @room.invite_code
  json.venue_ids @room.venues.map(&:id)
end
