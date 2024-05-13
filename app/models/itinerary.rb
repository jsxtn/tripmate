class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy
  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
end
