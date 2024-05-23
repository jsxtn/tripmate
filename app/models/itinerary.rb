require "open-uri"

class Itinerary < ApplicationRecord
  # after_save if: -> { saved_change_to_name? } do
  #   set_photo
  # end

  belongs_to :user
  has_many :activities, dependent: :destroy
  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }

  has_one_attached :photo

  # def ai_response

  #   if super.blank?
  #     set_content
  #   else
  #     super
  #   end
  # end

  # private

  # def set_content
  #   # API
  #   # client = OpenAI::Client.new
  #   # response = client.chat(parameters: {
  #   #   model: "gpt-3.5-turbo",

  #   #   messages: [{ role: "user", content: "You are a travel agent with 20 years of experience of travelling the world and you love to create perfect itineraries for customers. You will be building the perfect customised itinerary for a customer.  Each activity needs to be real and contain correct accurate data. The information required for each activity is datetime, Title, Duration, description, address, category, country, city, phone number, url, and the complete precise longitude and latitude. The datetime field which will be populated with a date and time.  Please consider the customers preferences below and complete the assembly instructions procedurally: Preferences: Country: #{name}, Cities: #{answer3}, Date range: #{start_date} to #{end_date}, Preferences: #{answer6}, Accessibility requirements: #{answer6}.  Assembly: 1. create 1 day of the itinerary 2. attribute 3 activities to that day as per the customer's preferences 3. add an eatery 3. repeat the above steps until you reach the end of the specified date range.PRINT OUT ALL ACTIVITIES FOR THE WHOLE DATE RANGE. DO NOT STOP UNTIL YOU HAVE GENERATED 3 ACTIVITIES FOR EACH OF THE DAYS IN THE GIVEN DATE RANGE. Only respond with the required itinerary in an array and please do not send any other information."}]

  #   #   #messages: [{ role: "user", content: "You are a travel agent with 20 years of experience of travelling the world and you love to create perfect itineraries for customers. You will be building the perfect customised itinerary for a customer.  Each activity needs to be real and contain correct accurate data. The information required for each activity is Datetime, Title, duration, description, address, category, country, city, phone number, website url, and the complete precise longitude and latitude. The datetime field which will be populated with a date and time.  Please consider the customers Preferences: Country: #{name}, Cities: #{answer3}, Date range: #{start_date} to #{end_date}, Preferences: #{answer6}, Accessibility requirements: #{answer6}.  Also include datetime field which will be populated with a date and time, and allocate 3 activities per day from #{start_date} until #{end_date}. PRINT OUT ALL ACTIVITIES FOR THE WHOLE DATE RANGE. DO NOT STOP UNTIL YOU HAVE GENERATED 3 ACTIVITIES FOR EACH OF THE DAYS IN THE GIVEN DATE RANGE. Only respond with the required itinerary in an array and please do not send any other information."}]


  #   #   })
  #   # new_content = response["choices"][0]["message"]["content"]
  #   # update(ai_response: new_content)


  #   return new_content


  # end
  private

  def set_photo
    client = OpenAI::Client.new
    response = client.images.generate(parameters: {
      prompt: "Give me an accurate image of a well known landmark or area or tourist attraction in #{answer1}", size: "256x256"
    })

    image_id = response["data"][0]["id"]
    url = response["data"][0]["url"]
    file =  URI.open(url)

    photo.purge if photo.attached?

    photo.attach(io: file, filename: "#{image_id}#{id}_#{name}.png", content_type: "image/png")
    return photo
  end
end
