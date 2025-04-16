json.room do
  json.id @room.id
  json.name @room.name
  json.invite_code @room.invite_code
  json.status @room.status
  json.attendees do
    json.array! @attendees do |attendee|
      json.id attendee.id
      json.name attendee.name
    end
  end
  json.venues do
    json.array! @venues do |venue|
      json.id venue.id
      json.name venue.name
      json.category venue.category
      json.instagram_link venue.instagram_link
      json.cost venue.cost
      json.rating venue.rating
      json.votes do
        json.array! @votes do |vote|
          json.attendee_id vote.attendee_id
          json.venue_id @room_venue_by_id[vote.rooms_venues_id].venue_id
        end
      end
    end
  end
end
