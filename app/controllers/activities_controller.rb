class ActivitiesController < ApplicationController


  def index
    # @itineraries = Itinerary.all
    @username = current_user.first_name

    # @itineraries = Itinerary.find(user_id: current_user.id)
    @itinerary = Itinerary.find(params[:itinerary_id])


    @activities_by_datetime = @itinerary.activities.order(datetime: :asc).group_by { |activity| activity.datetime.to_date }.values


    # @activities_by_datetime = @itinerary.activities.order(datetime: :asc)

    # geocoding
    @activities = @itinerary.activities
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


  def show
    # @itineraries = Itinerary.all
    @username = current_user.first_name
    # @itinerary = Itinerary.find(params[:itinerary_id])


    @activity = Activity.find(params[:id])
    @itinerary = Itinerary.find(@activity.itinerary_id)

    # geocoding
    # @activities = Activity.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = [{
        lat: @activity.latitude,
        lng: @activity.longitude,
        info_window_html: render_to_string(partial: "shared/info_window", locals: {activity: @activity}),
        marker_html: render_to_string(partial: "shared/marker", locals: {activity: @activity})
      }]
  end


  # private

  # def activity_params
  #   params.require(:activity).permit(:country)
  # end


end
