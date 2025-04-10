json.attendee do
  json.id @attendee.id
  json.room_name @attendee.room.name
  json.attendees do
    json.array! @attendee.room.attendees, :id, :name
  end
end
