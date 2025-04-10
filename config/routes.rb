Rails.application.routes.draw do
  post '/rooms', to: 'rooms#create'
  post 'rooms/:invite', to: 'rooms#join'
  post '/venues', to: 'venues#create'
  post '/attendees', to: 'attendees#create'
end
