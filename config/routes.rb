Rails.application.routes.draw do
  constraints format: 'json' do
    # Rooms
    post '/rooms', to: 'rooms#create'
    post '/rooms/:id', to: 'rooms#update'
    get '/rooms/:id', to: 'rooms#show'
    # Venues
    get '/venues', to: 'venues#index'
    post '/venues', to: 'venues#create'

    # Attendees
    post '/attendees', to: 'attendees#create'

    # Votes
    post '/votes', to: 'votes#create'
  end
end
