json.array! @venues do |venue|
  json.name venue.name
  json.instagram_link venue.instagram_link
  json.menu_link venue.menu_link
  json.cost venue.cost
  json.rating venue.rating
  json.category venue.category
end
