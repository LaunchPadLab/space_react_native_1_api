class RoomVenue < ApplicationRecord
  self.table_name = 'rooms_venues'

  belongs_to :room
  belongs_to :venue

  has_many :votes, foreign_key: :rooms_venues_id
end
