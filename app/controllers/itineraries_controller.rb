require "json"

class ItinerariesController < ApplicationController

  def index
    # @itineraries = Itinerary.all
    @username = current_user.first_name

    # @itineraries = Itinerary.find(user_id: current_user.id)
    @itineraries = current_user.itineraries

      #  # geocoding
      #  @activities = @itineraries.activities
      #  # The `geocoded` scope filters only flats with coordinates
      #     @markers = @activities.map do |activity|
      #       {
      #         lat: activity.latitude,
      #         lng: activity.longitude,
      #         info_window_html: render_to_string(partial: "shared/info_window", locals: {activity: activity}),
      #         marker_html: render_to_string(partial: "shared/marker", locals: {activity: activity})
      #       }

      @activities = current_user.activities

      # The `geocoded` scope filters only flats with coordinates
          @markers = @activities.map do |activity|
            {
              lat: activity.latitude,
              lng: activity.longitude,
              info_window_html: render_to_string(partial: "shared/info_window", locals: {activity: activity}),
              marker_html: render_to_string(partial: "shared/marker", locals: {activity: activity})
            }
          end


  end


  def new
    # @itineraries = Itinerary.all
    @username = current_user.first_name

    @itinerary = Itinerary.new
    @activity = Activity.new
  end


  def create

    @name = "#{current_user.first_name}'s cool trip to #{itinerary_params[:answer1]}"

    @itinerary = Itinerary.new(itinerary_params)

    # build prompt string for openAI API call, based on users responses
    # Make API call passing in the prompt
    # Capture the response from the API call

    client = OpenAI::Client.new
     response = client.chat(parameters: {
     model: "gpt-3.5-turbo",

     messages: [{ role: "user", content: "You are a travel agent with 20 years of experience of travelling the world and you love to
      create perfect itineraries for customers. You will be building the perfect customised itinerary for a customer.  Each activity
      needs to be real and contain correct accurate data. The information required for each activity is datetime, title,
      description, address, category, country, city, phone number, url, and the complete precise longitude and latitude. The datetime
      field which will be populated with a date and time.  Please consider the customers preferences below: Country: #{@itinerary.name},
      Cities: #{@itinerary.answer3}, Date range: #{@itinerary.start_date} to #{@itinerary.end_date}, Preferences: #{@itinerary.answer6},
      Accessibility requirements: #{@itinerary.answer6}.  PRINT OUT ALL ACTIVITIES FOR THE WHOLE DATE RANGE. DO NOT STOP UNTIL YOU HAVE
      GENERATED 3 ACTIVITIES FOR EACH OF THE DAYS IN THE GIVEN DATE RANGE. Only respond with the required itinerary in a JSON which should be called itinerary. Please do not
      send any other information. Do not return authenticity_token"}]

      # messages: [{ role: "user", content: "You are a travel agent with 20 years of experience of travelling the world and you love to
      #   create perfect itineraries for customers. You will be building the perfect customised itinerary for a customer.  Each activity
      #   needs to be real and contain correct accurate data. The information required for each activity is datetime, Title,
      #   description, address, category, country, city, phone number, url, and the complete precise longitude and latitude. The datetime
      #   field which will be populated with a date and time.  Please consider the customers preferences below and complete the assembly
      #   instructions procedurally: Preferences: Country: #{@itinerary.name}, Cities: #{@itinerary.answer3},
      #   Date range: #{@itinerary.start_date} to #{@itinerary.end_date}, Preferences: #{@itinerary.answer6},
      #   Accessibility requirements: #{@itinerary.answer6}.  Assembly: 1. create 1 day of the itinerary 2. attribute 3 activities
      #   to that day as per the customer's preferences 3. add an eatery 3. repeat the above steps until you reach the end of the
      #   specified date range.PRINT OUT ALL ACTIVITIES FOR THE WHOLE DATE RANGE. DO NOT STOP UNTIL YOU HAVE GENERATED 3 ACTIVITIES
      #   FOR EACH OF THE DAYS IN THE GIVEN DATE RANGE. Only respond with the required itinerary in a JSON and please do not
      #     send any other information."}]

    #   #messages: [{ role: "user", content: "You are a travel agent with 20 years of experience of travelling the world and you love to create perfect itineraries for customers. You will be building the perfect customised itinerary for a customer.  Each activity needs to be real and contain correct accurate data. The information required for each activity is Datetime, Title, duration, description, address, category, country, city, phone number, website url, and the complete precise longitude and latitude. The datetime field which will be populated with a date and time.  Please consider the customers Preferences: Country: #{@itinerary.name}, Cities: #{@itinerary.answer3}, Date range: #{@itinerary.start_date} to #{@itinerary.end_date}, Preferences: #{@itinerary.answer6}, Accessibility requirements: #{@itinerary.answer6}.  Also include datetime field which will be populated with a date and time, and allocate 3 activities per day from #{@itinerary.start_date} until #{@itinerary.end_date}. PRINT OUT ALL ACTIVITIES FOR THE WHOLE DATE RANGE. DO NOT STOP UNTIL YOU HAVE GENERATED 3 ACTIVITIES FOR EACH OF THE DAYS IN THE GIVEN DATE RANGE. Only respond with the required itinerary in an array and please do not send any other information."}]

    #   #const completion = await openai.chat.completions.create({messages: message.messages, model: OPENAI_MODEL, response_format: {type: "json_object"}})
    #   })

    # response = await openai.chat.completions.create(
    #   {   model: "gpt-3.5-turbo",
    #       response_format: {"type": "json_object"},
    #       messages: [ { "You are a travel agent with 20 years of experience of travelling the world and you love to create perfect itineraries for customers. You will be building the perfect customised itinerary for a customer.  Each activity needs to be real and contain correct accurate data. The information required for each activity is datetime, Title, Duration, description, address, category, country, city, phone number, url, and the complete precise longitude and latitude. The datetime field which will be populated with a date and time.  Please consider the customers preferences below and complete the assembly instructions procedurally: Preferences: Country: #{@itinerary.name}, Cities: #{@itinerary.answer3}, Date range: #{@itinerary.start_date} to #{@itinerary.end_date}, Preferences: #{@itinerary.answer6}, Accessibility requirements: #{@itinerary.answer6}.  Assembly: 1. create 1 day of the itinerary 2. attribute 3 activities to that day as per the customer's preferences 3. add an eatery 3. repeat the above steps until you reach the end of the specified date range.PRINT OUT ALL ACTIVITIES FOR THE WHOLE DATE RANGE. DO NOT STOP UNTIL YOU HAVE GENERATED 3 ACTIVITIES FOR EACH OF THE DAYS IN THE GIVEN DATE RANGE. Only respond with the required itinerary in a ruby array and please do not send any other information.
    #        { "Day": [
    #             {
    #                 "datetime": "...", # This is the date and time of the activity in the given day.
    #                 "Title": "...", # This is the name of hte activity
    #                 "Duration": "...", # This is the estimated duration of the activity
    #                 "description": "...", # This is the description of the activity
    #                 "address": "..." # This is the address of the activity
    #                 "category": "..." # This is the category of the activity
    #                 "country": "..." # This is the country of the activity
    #                 "city": "..." # This is the city of the activity
    #                 "phone_number": "..." # This is the phone number of the activity
    #                 "website_url": "..." # This is the website_url of the activity
    #                 "longitude": "..." # This is the longitude of the activity
    #                 "latitude": "..." # This is the latitude of the activity
    #             }
    #         ] }
    #     } ]

       })


    @activities_response = response["choices"][0]["message"]["content"]

    @activities = JSON.parse(@activities_response, symbolize_names: true)

    @itinerary.ai_response = @activities_response
    @itinerary.user = current_user
    @itinerary.name = @name

    # create and save new Activities with response
    if @itinerary.save!

      @activities[:itinerary].each do |activity|

          activity_new = Activity.new(build_activity(activity, @itinerary.id))
          activity_new.save!
        end
    end

    redirect_to itinerary_activities_path(@itinerary)

  end

  private

  def build_activity(values, itinerary_id)
    {
      itinerary_id: itinerary_id,

      datetime: values[:datetime],
      title: values[:title],
      description: values[:description],
      address: values[:address],
      category: values[:category],
      country: values[:country],
      city: values[:city],
      phone_number: values[:phone_number],
      url: values[:url],
      longitude: values[:longitude],
      latitude: values[:latitude]
    }
  end

  def itinerary_params
    params.require(:itinerary).permit(:answer1, :start_date, :end_date, :answer3, :answer4, :answer5, :answer6)
  end

 [["name", "Hafsah's cool trip to France"], ["start_date", "2024-06-06 00:00:00"], ["end_date", "2024-06-08 00:00:00"], ["user_id", 8], ["created_at", "2024-05-20 13:46:36.298563"], ["updated_at", "2024-05-20 13:46:36.298563"], ["answer1", "France"], ["answer3", "Paris"], ["answer4", "Theatre, sightseeing, museum"], ["answer5", "French"], ["answer6", "no"], ["ai_prompt", nil], ["ai_response", "{\n    \"itinerary\": [\n        {\n            \"datetime\": \"2024-06-06 09:00:00\",\n            \"Title\": \"Eiffel Tower\",\n            \"description\": \"Visit the iconic Eiffel Tower and enjoy breathtaking views of Paris from the top\",\n            \"address\": \"Champ de Mars, 5 Avenue Anatole, 75007 Paris, France\",\n            \"category\": \"Landmark\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"+33 892 70 12 39\",\n            \"url\": \"https://www.toureiffel.paris/en\",\n            \"longitude\": \"48.8584\",\n            \"latitude\": \"2.2945\"\n        },\n        {\n            \"datetime\": \"2024-06-06 13:00:00\",\n            \"Title\": \"Louvre Museum\",\n            \"description\": \"Explore the world-renowned Louvre Museum and see famous artworks like the Mona Lisa\",\n            \"address\": \"Rue de Rivoli, 75001 Paris, France\",\n            \"category\": \"Museum\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"+33 1 40 20 50 50\",\n            \"url\": \"https://www.louvre.fr/en\",\n            \"longitude\": \"48.8606\",\n            \"latitude\": \"2.3376\"\n        },\n        {\n            \"datetime\": \"2024-06-06 18:00:00\",\n            \"Title\": \"Seine River Cruise\",\n            \"description\": \"Enjoy a relaxing cruise along the Seine River and admire the stunning architecture of Paris\",\n            \"address\": \"Port de la Bourdonnais, 75007 Paris, France\",\n            \"category\": \"Cruise\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"+33 1 76 64 14 45\",\n            \"url\": \"https://www.bateauxparisiens.com/en.html\",\n            \"longitude\": \"48.8584\",\n            \"latitude\": \"2.2945\"\n        },\n        {\n            \"datetime\": \"2024-06-07 09:00:00\",\n            \"Title\": \"Palace of Versailles\",\n            \"description\": \"Step back in time with a visit to the opulent Palace of Versailles and its beautiful gardens\",\n            \"address\": \"Place d'Armes, 78000 Versailles, France\",\n            \"category\": \"Historical Site\",\n            \"country\": \"France\",\n            \"city\": \"Versailles\",\n            \"phone number\": \"+33 1 30 83 78 00\",\n            \"url\": \"http://en.chateauversailles.fr/\",\n            \"longitude\": \"48.8048\",\n            \"latitude\": \"2.1204\"\n        },\n        {\n            \"datetime\": \"2024-06-07 13:00:00\",\n            \"Title\": \"Montmartre\",\n            \"description\": \"Explore the charming neighborhood of Montmartre, known for its artistic history\",\n            \"address\": \"Montmartre, 75018 Paris, France\",\n            \"category\": \"Neighborhood\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"\",\n            \"url\": \"https://en.parisinfo.com/paris-guide/paris-by-district/montmartre/montmartre\",\n            \"longitude\": \"48.8867\",\n            \"latitude\": \"2.3431\"\n        },\n        {\n            \"datetime\": \"2024-06-07 18:00:00\",\n            \"Title\": \"Moulin Rouge\",\n            \"description\": \"Experience a cabaret show at the famous Moulin Rouge in Pigalle\",\n            \"address\": \"82 Boulevard de Clichy, 75018 Paris, France\",\n            \"category\": \"Entertainment\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"+33 1 53 09 82 82\",\n            \"url\": \"https://www.moulinrouge.fr/\",\n            \"longitude\": \"48.8844\",\n            \"latitude\": \"2.3323\"\n        },\n        {\n            \"datetime\": \"2024-06-08 09:00:00\",\n            \"Title\": \"Catacombs of Paris\",\n            \"description\": \"Descend into the eerie underground Catacombs of Paris filled with skulls and bones\",\n            \"address\": \"1 Avenue du Colonel Henri Rol-Tanguy, 75014 Paris, France\",\n            \"category\": \"Historical Site\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"+33 1 43 22 47 63\",\n            \"url\": \"http://catacombes.paris.fr/en\",\n            \"longitude\": \"48.8338\",\n            \"latitude\": \"2.3329\"\n        },\n        {\n            \"datetime\": \"2024-06-08 13:00:00\",\n            \"Title\": \"Luxembourg Gardens\",\n            \"description\": \"Relax in the beautiful Luxembourg Gardens, a popular spot for locals and tourists\",\n            \"address\": \"Rue de Médicis, 75006 Paris, France\",\n            \"category\": \"Park\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"+33 1 42 34 23 62\",\n            \"url\": \"https://en.wikipedia.org/wiki/Luxembourg_Gardens\",\n            \"longitude\": \"48.8462\",\n            \"latitude\": \"2.3371\"\n        },\n        {\n            \"datetime\": \"2024-06-08 18:00:00\",\n            \"Title\": \"Sacre-Coeur Basilica\",\n            \"description\": \"Visit the stunning Sacre-Coeur Basilica in Montmartre and enjoy panoramic views of Paris\",\n            \"address\": \"35 Rue du Chevalier de la Barre, 75018 Paris, France\",\n            \"category\": \"Religious Site\",\n            \"country\": \"France\",\n            \"city\": \"Paris\",\n            \"phone number\": \"+33 1 53 41 89 00\",\n            \"url\": \"https://www.sacre-coeur-montmartre.com/\",\n            \"longitude\": \"48.8867\",\n            \"latitude\": \"2.3430\"\n        }\n    ]\n}"], ["answer2", nil], ["answer2startdate", nil], ["answer2enddate", nil]]

end
