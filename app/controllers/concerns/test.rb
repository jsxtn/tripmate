require "JSON"

class ItinerariesController < ApplicationController

  def index
    # @itineraries = Itinerary.all
    @username = current_user.first_name

    # @itineraries = Itinerary.find(user_id: current_user.id)
    @itineraries = Itinerary.where(user_id: current_user.id)

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
        needs to be real and contain correct accurate data. The information required for each activity is datetime, Title,
        description, address, category, country, city, phone number, url, and the complete precise longitude and latitude. The datetime
        field which will be populated with a date and time.  Please consider the customers preferences below and complete the assembly
        instructions procedurally: Preferences: Country: #{@itinerary.name}, Cities: #{@itinerary.answer3},
        Date range: #{@itinerary.start_date} to #{@itinerary.end_date}, Preferences: #{@itinerary.answer6},
        Accessibility requirements: #{@itinerary.answer6}.  Assembly: 1. create 1 day of the itinerary 2. attribute 3 activities
        to that day as per the customer's preferences 3. add an eatery 3. repeat the above steps until you reach the end of the
        specified date range.PRINT OUT ALL ACTIVITIES FOR THE WHOLE DATE RANGE. DO NOT STOP UNTIL YOU HAVE GENERATED 3 ACTIVITIES
        FOR EACH OF THE DAYS IN THE GIVEN DATE RANGE. Only respond with the required itinerary in a JSON and please do not
          send any other information."}]

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


    @activities_repsonse = response["choices"][0]["message"]["content"]

    @activities = JSON.parse(@activities_repsonse, symbolize_names: true)
    @activities = @activities[:itinerary]
    # update Itinerary table with response

    @itinerary.ai_response = @activities_repsonse
    @itinerary.user = current_user
    @itinerary.name = @name

    # create and save new Activities with response
    if @itinerary.save!
      @activities.each do |activity_day|
        activity_day[:activities].each do |activity|
          activity_new = Activity.new(activity)
          activity_new.itinerary = @itinerary

          #activity_new = Activity.new(build_activity(activity, @itinerary.id))
          activity_new.save!
        end
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
    params.require(:itinerary).permit( :answer1, :start_date, :end_date, :answer3, :answer4, :answer5, :answer6)
  end

end
