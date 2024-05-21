class Activity < ApplicationRecord
  belongs_to :itinerary
  validates :datetime, :longitude, :latitude, :title, :category, presence: true

  # geocoding
  geocoded_by :address
  after_validation :geocode, if:
   :will_save_change_to_address?
end
