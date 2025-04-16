json.array! @venues do |venue|
  json.id venue.id
  json.name venue.name
  json.instagram_link venue.instagram_link
  json.menu_link venue.menu_link
  json.cost venue.cost
  json.rating venue.rating
  json.category venue.category
  json.latitude venue.lat
  json.longitude venue.lng
end
