require "open-uri"

class Activity < ApplicationRecord
  belongs_to :itinerary
  validates :datetime, :longitude, :latitude, :title, :category, presence: true
  has_one_attached :photo

  after_save if: -> { saved_change_to_title? } do
    set_photo
  end

  # geocoding
  geocoded_by :address
  after_validation :geocode, if:
   :will_save_change_to_address?
  
  private

  def set_photo
    client = OpenAI::Client.new
    response = client.images.generate(parameters: {
      prompt: "Give me an accurate image of  #{title} located at #{address}" , size: "256x256"
    })

    image_id = response["data"][0]["id"]
    url = response["data"][0]["url"]
    file =  URI.open(url)

    photo.purge if photo.attached?

    photo.attach(io: file, filename: "#{image_id}#{id}_#{title}.png", content_type: "image/png")
    return photo
  end

end
