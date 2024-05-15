class ItinerariesController < ApplicationController

  def index
    # @itineraries = Itinerary.all
    @username = current_user.first_name

    # @itineraries = Itinerary.find(user_id: current_user.id)
    @itineraries = Itinerary.where(user_id: current_user.id)

  end
end
