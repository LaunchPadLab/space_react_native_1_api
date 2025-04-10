class Room < ApplicationRecord
  has_and_belongs_to_many :venues
  has_many :attendees

  validates_presence_of :name

  enum status: { open: 0, closed: 1 }
end
