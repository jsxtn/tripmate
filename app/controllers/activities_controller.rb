class ActivitiesController < ApplicationController


  def index
    # @itineraries = Itinerary.all
    @username = current_user.first_name

    # @itineraries = Itinerary.find(user_id: current_user.id)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @activities_by_datetime = @itinerary.activities.group_by { |activity| activity.datetime.to_date }.values

  end


  def show
    # @itineraries = Itinerary.all
    @username = current_user.first_name
    # @itinerary = Itinerary.find(params[:itinerary_id])
    @activity = Activity.find(params[:id])
    @itinerary = Itinerary.find(@activity.itinerary_id)

  end

  # private

  # def activity_params
  #   params.require(:activity).permit(:country)
  # end

end
