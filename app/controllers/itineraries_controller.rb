class ItinerariesController < ApplicationController

  def index
    # @itineraries = Itinerary.all
    @username = current_user.first_name

    # @itineraries = Itinerary.find(user_id: current_user.id)
    @itineraries = Itinerary.where(user_id: current_user.id)

     # geocoding
     @activities = Activity.all
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
    @itinerary.user = current_user
    @itinerary.name = @name
    @itinerary.save!
    redirect_to itineraries_path()

    # build prompt string for openAI API call, based on users responses
    # update Itinerary table with the prompt
    # Make API call passing in the prompt
    # Capture the response from the API call

    # Run sanitization method to prepare prompt data for entry into the database
      #shape it with gsub

          # update Itinerary table with the response

    # loop round each item (i.e. row) in the hash variable
            # make a call to activity.new(@response)
            # then call activity.save
    # end

    # redirect to Activity.index showing all activity for that itinerary for that user.

  end

  private

  def itinerary_params
    params.require(:itinerary).permit( :answer1, :start_date, :end_date, :answer3, :answer4, :answer5, :answer6)
  end

end
