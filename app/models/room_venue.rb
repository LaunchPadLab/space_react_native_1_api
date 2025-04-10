class RoomVenue < ApplicationRecord
  belongs_to :room
  belongs_to :venue

  has_many :votes
end
