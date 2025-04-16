class Venue < ApplicationRecord
  has_and_belongs_to_many :rooms

  enum category: { 'Tex-Mex': 0, Japanese: 1, Italian: 2, Mexican: 3 }
end
