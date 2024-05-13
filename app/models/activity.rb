class Activity < ApplicationRecord
  belongs_to :itinerary
  validates :datetime, :longitude, :latitude, :title, :category, presence: true
end
